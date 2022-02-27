using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using OfficeOpenXml;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace BusinessLayer.BusinessAccess
{
    public class FileManagement : IFileManagement
    {
        readonly string excelPath = HttpContext.Current.Server.MapPath("~/Files/");
        private readonly IPerformanceManagement _performanceManagement;
        private readonly IPerformanceData<studentdailyperformance> _performanceData;
        private readonly string _studentPerformance = "studentdailyperformance";

        public FileManagement()
        {
            _performanceManagement = new PerformanceManagement();
            _performanceData = new StudentDailyPerformanceData();
        }

        public FileManagement(IPerformanceManagement performanceManagement)
        {
            _performanceManagement = performanceManagement ?? throw new ArgumentNullException(nameof(performanceManagement));
        }

        public int UploadExcel(HttpPostedFile httpPostedFile)
        {
            return Upload(httpPostedFile);            
        }

        protected int Upload(HttpPostedFile httpPostedFile)
        {
            int sheetNumber = 1;
            try
            {
                UploadPrimaryDetails primaryDetails = new UploadPrimaryDetails();
                var excel = new ExcelPackage(httpPostedFile.InputStream);

                int sheetCount = excel.Workbook.Worksheets.Count;
                
                while (sheetNumber <= sheetCount)
                {
                    var sheet = excel.Workbook.Worksheets[sheetNumber];
                    var sheetName = excel.Workbook.Worksheets[sheetNumber].Name;
                    var excelData = ExcelPackageExtensions.ToPrimaryDataTable(sheet);
                    if (sheetNumber == 1)
                        primaryDetails = GetPrimaryDetails(excelData);
                    else
                    {
                        excelData = ExcelPackageExtensions.ToDataTable(sheet, primaryDetails);
                        _performanceData.DuplicateCheckForBulkUploadPerformanceData(primaryDetails.SchoolId, primaryDetails.ClassId, primaryDetails.MonthId, primaryDetails.YearId, Convert.ToInt32(sheetName));
                        BulkUploadToDB(excelData, _studentPerformance);
                    }

                    sheetNumber++;
                }
                return 200;
            }
            catch
            {
                return sheetNumber;
            }

        }

        private UploadPrimaryDetails GetPrimaryDetails(DataTable dataTable)
        {
            string schoolColumn = dataTable.Columns[0].ColumnName;
            string classColumn = dataTable.Columns[1].ColumnName;
            string monthColumn = dataTable.Columns[2].ColumnName;
            string yearColumn = dataTable.Columns[3].ColumnName;
            string school = dataTable.Rows[0][schoolColumn].ToString();
            string className = dataTable.Rows[0][classColumn].ToString();
            string month = dataTable.Rows[0][monthColumn].ToString();
            string year = dataTable.Rows[0][yearColumn].ToString();
            return _performanceManagement.GetPrimaryDetails(school, className, month, year);
        }

        public int GetSchoolMapId(string rollnumber,int schoolId,int classId)
        {
            return _performanceData.GetStudentSchoolMapId(rollnumber,schoolId,classId);
        }

        public int InsertAlterParameter(int parameterId, int schoolId, string alterParameter)
        {
            return _performanceData.InsertAlterParameter(parameterId, schoolId, alterParameter);
        }

        //protected void Upload(HttpPostedFile PostedFile)
        //{
        //    string conString = string.Empty;
        //    string extension = Path.GetExtension(PostedFile.FileName);
        //    switch (extension)
        //    {
        //        case ".xls": //Excel 97-03
        //            conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
        //            break;
        //        case ".xlsx": //Excel 07 or higher
        //            conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
        //            break;

        //    }
        //    conString = string.Format(conString, excelPath + PostedFile.FileName);
        //    using (OleDbConnection excel_con = new OleDbConnection(conString))
        //    {
        //        excel_con.Open();
        //        int sheetCount = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows.Count;
        //        GetPrimaryDetails(excel_con);
        //        for (int i = 1;i<sheetCount;i++)
        //        {
        //            UploadSheetData(excel_con,i);
        //        }
        //        excel_con.Close();
        //    }
        //}



        //private void GetPrimaryDetails(OleDbConnection excel_con)
        //{
        //    string sheet = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
        //    DataTable dtExcelData = new DataTable();

        //    //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
        //    dtExcelData.Columns.AddRange(new DataColumn[4] {
        //        new DataColumn("School", typeof(string)),
        //        new DataColumn("Class", typeof(string)),
        //        new DataColumn("Month", typeof(string)),
        //        new DataColumn("Year", typeof(decimal)),
        //    });
            
        //    using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet + "]", excel_con))
        //    {
        //        oda.Fill(dtExcelData.DataSet);
        //    }
        //    foreach(var row in dtExcelData.DataSet.Tables[0].Rows)
        //    {
               
        //    }

        //    //var details = _performanceManagement.GetPrimaryDetails(dtExcelData.DataSet.Tables[0].Rows[0]);
        //    //return 

        //}
                
        private void BulkUploadToDB(DataTable dtExcelData,string tableName)
        {
            string consString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (var conn = new SqlConnection(consString))
            {
                var bulkCopy = new SqlBulkCopy(conn);
                string table = tableName;
                bulkCopy.DestinationTableName = table;
                conn.Open();
                var schema = conn.GetSchema("Columns", new[] { null, null, table, null });
                foreach (DataColumn sourceColumn in dtExcelData.Columns)
                {
                    foreach (DataRow row in schema.Rows)
                    {
                        if (string.Equals(sourceColumn.ColumnName, (string)row["COLUMN_NAME"], StringComparison.OrdinalIgnoreCase))
                        {
                            bulkCopy.ColumnMappings.Add(sourceColumn.ColumnName, (string)row["COLUMN_NAME"]);
                            break;
                        }
                    }
                }
                bulkCopy.WriteToServer(dtExcelData);
            }
        }
    }
}
