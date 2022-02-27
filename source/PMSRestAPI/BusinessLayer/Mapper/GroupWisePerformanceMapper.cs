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
    public class GroupWisePerformanceMapper : IMapper2<group, List<studentdailyperformance>, GroupWisePerformance>
    {
        public GroupWisePerformance Map(group groupIn, List<studentdailyperformance> dailyperformanceIn)
        {
            GroupWisePerformance groupWisePerformance = new GroupWisePerformance();
            groupWisePerformance.GroupId = groupIn.groupid;
            groupWisePerformance.GroupName = groupIn.groupname;

            foreach (var singleDayPerformance in dailyperformanceIn)
            {
                if (singleDayPerformance.Attendance == 1)
                {
                    groupWisePerformance.Attendance += 5;
                }
                if (singleDayPerformance.Discipline == 1)
                {
                    groupWisePerformance.Discipline += 5;
                }
                if (singleDayPerformance.HomeWork == 1)
                {
                    groupWisePerformance.Homework += 5;
                }

                var totalPerform = (Convert.ToInt32(singleDayPerformance.Attendance) * 5) + (Convert.ToInt32(singleDayPerformance.Discipline) * 5) + (Convert.ToInt32(singleDayPerformance.HomeWork) * 5);
                groupWisePerformance.Points = totalPerform == 15 ? groupWisePerformance.Points + totalPerform + 5 : groupWisePerformance.Points + totalPerform;
            }

            return groupWisePerformance;
        }

    }
}
