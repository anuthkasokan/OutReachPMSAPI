using BusinessLayer.Model;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.BusinessAccess
{
    public static class ExcelPackageExtensions
    {
        public static DataTable ToDataTable(this ExcelWorksheet workSheet,UploadPrimaryDetails primaryDetails)
        {
            DataTable table = new DataTable();
            //adding columns
            table.Columns.Add("studentschoolmapid");
            table.Columns.Add("Attendance");
            table.Columns.Add("Discipline");
            table.Columns.Add("HomeWork");
            table.Columns.Add("day");
            table.Columns.Add("monthid");
            table.Columns.Add("yearid");
            table.Columns.Add("created_on");
            table.Columns.Add("Points");

            FileManagement fileManagement = new FileManagement();
            //insert alternate parameter to parameter schoolmapid
            var rowParameter = workSheet.Cells[1, 2, 1, 4];
            int parId = 1;
            foreach(var cell in rowParameter)
            {
                var parameter = cell.Text;
                fileManagement.InsertAlterParameter(parId, primaryDetails.SchoolId, parameter);
                parId++;
            }

            //adding rows
            int studentschoolmapid = 0;
            for (var rowNumber = 2; rowNumber <= workSheet.Dimension.End.Row; rowNumber++)
            {
                var row = workSheet.Cells[rowNumber, 1, rowNumber, workSheet.Dimension.End.Column];
                var newRow = table.NewRow();
                var columnNumber = 0;
                foreach (var cell in row)
                {
                    var c = cell.Address;
                    
                    if(columnNumber == 0)
                        studentschoolmapid = fileManagement.GetSchoolMapId(cell.Text,primaryDetails.SchoolId,primaryDetails.ClassId);

                    switch(columnNumber)
                    {
                        case 0 : newRow[columnNumber] = studentschoolmapid;
                            break;
                        case 1:
                            newRow[columnNumber] = cell.Text;
                            break;
                        case 2:
                            newRow[columnNumber] = cell.Text;
                            break;
                        case 3:
                            newRow[columnNumber] = cell.Text;
                            columnNumber++;
                            newRow[columnNumber] = Convert.ToInt32(workSheet.Name);
                            columnNumber++;
                            newRow[columnNumber] = primaryDetails.MonthId;
                            columnNumber++;
                            newRow[columnNumber] = primaryDetails.YearId;
                            columnNumber++;
                            newRow[columnNumber] = DateTime.Now;
                            columnNumber++;
                            newRow[columnNumber] = 0;
                            break;
                        default:                            
                            break;
                    }

                    columnNumber++;
                }
                table.Rows.Add(newRow);
            }
            return table;
        }

        public static DataTable ToPrimaryDataTable(this ExcelWorksheet workSheet)
        {
            //ExcelWorksheet workSheet = package.Workbook.Worksheets[0];

            DataTable table = new DataTable();
            //adding columns
            foreach (var firstRowCell in workSheet.Cells[1, 1, 1, workSheet.Dimension.End.Column])
            {
                table.Columns.Add(firstRowCell.Text);
            }
            //adding rows
            for (var rowNumber = 2; rowNumber <= workSheet.Dimension.End.Row; rowNumber++)
            {
                var row = workSheet.Cells[rowNumber, 1, rowNumber, workSheet.Dimension.End.Column];
                var newRow = table.NewRow();
                foreach (var cell in row)
                {
                    newRow[cell.Start.Column - 1] = cell.Text;
                }
                table.Rows.Add(newRow);
            }
            return table;
        }
    }
}
