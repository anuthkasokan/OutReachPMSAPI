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
    public class ClassWisePerformanceMapper:IMapper2<@class,List<studentdailyperformance>,ClassWisePerformance>
    {
        public ClassWisePerformance Map(@class classDetailIn,List<studentdailyperformance> dailyPerformancesIn)
        {
            ClassWisePerformance performanceDetails = new ClassWisePerformance();
            performanceDetails.ClassId = classDetailIn.classid;
            performanceDetails.ClassName = classDetailIn.classname;

            foreach (var singleDayPerformance in dailyPerformancesIn)
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

                var totalPerform = (Convert.ToInt32(singleDayPerformance.Attendance) * 5) + (Convert.ToInt32(singleDayPerformance.Discipline) * 5 )+ (Convert.ToInt32(singleDayPerformance.HomeWork) * 5);
                performanceDetails.Points = totalPerform ==15?performanceDetails.Points +totalPerform+5:performanceDetails.Points+totalPerform;
            }

            

            return performanceDetails;
        }

    }
}
