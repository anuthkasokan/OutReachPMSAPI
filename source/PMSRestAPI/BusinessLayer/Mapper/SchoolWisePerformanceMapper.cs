using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;

namespace BusinessLayer.Mapper
{
    public class SchoolWisePerformanceMapper:IMapper2<school,List<studentdailyperformance>,SchoolWisePerformance>
    {
        public SchoolWisePerformance Map(school schoolIn,List<studentdailyperformance> dailyperformanceIn)
        {
            SchoolWisePerformance performanceDetails = new SchoolWisePerformance();
            performanceDetails.SchoolId = schoolIn.schoolid;
            performanceDetails.SchoolName = schoolIn.schoolname;
            
            foreach(var singleDayPerformance in dailyperformanceIn)
            {
                if (singleDayPerformance.Attendance == 1)
                {
                    performanceDetails.Attendance += 5;
                }
                if (singleDayPerformance.Discipline == 1)
                {
                    performanceDetails.Discipline += 5;
                }
                if (singleDayPerformance.HomeWork == 1)
                {
                    performanceDetails.Homework += 5;
                }

                var totalPerform = (Convert.ToInt32(singleDayPerformance.Attendance) * 5) +( Convert.ToInt32(singleDayPerformance.Discipline) * 5) + (Convert.ToInt32(singleDayPerformance.HomeWork) * 5);
                performanceDetails.Points = totalPerform == 15 ? performanceDetails.Points + totalPerform + 5 : performanceDetails.Points + totalPerform;
            }


            return performanceDetails;
        }
    }
}
