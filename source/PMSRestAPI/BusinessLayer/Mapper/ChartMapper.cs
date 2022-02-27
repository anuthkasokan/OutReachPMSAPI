using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLayer.Interface;
using DataAccessLayer;

namespace BusinessLayer.Mapper
{
    public class ChartMapper:IMapper<List<studentdailyperformance>,int>
    {

        public int Map(List<studentdailyperformance> dailyPerformances)
        {
            int points = 0;
            
            foreach(var performance in dailyPerformances)
            {
                points = points + Convert.ToInt32(performance.Attendance)*5;
                points = points + Convert.ToInt32(performance.HomeWork)*5;
                points = points + Convert.ToInt32(performance.Discipline)*5;
                points = ((Convert.ToInt32(performance.Attendance) * 5) +(Convert.ToInt32(performance.HomeWork) * 5) +(Convert.ToInt32(performance.Discipline) * 5))==15? points + 5 : points;
            }

            return points;
        }
    }
}
