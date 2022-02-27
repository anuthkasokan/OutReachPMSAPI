using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.BusinessAccess
{
    public class PerformanceManagement : IPerformanceManagement
    {
        private readonly IGetPrimaryDetails _performanceData;

        public PerformanceManagement()
        {
            _performanceData = new StudentDailyPerformanceData();
        }
        public UploadPrimaryDetails GetPrimaryDetails(string school, string classname, string month, string year)
        {
            GetDataForExcelUpload_Result details = _performanceData.GetPrimaryDetails(school, classname, month, year);
            UploadPrimaryDetails primaryDetails = new UploadPrimaryDetails();
            primaryDetails.ClassId = details.ClassId ?? 0;
            primaryDetails.SchoolId = details.SchoolId ?? 0;
            primaryDetails.MonthId = details.MonthId ?? 0;
            primaryDetails.YearId = details.YearId?? 0;
            return primaryDetails;
        }
    }
}
