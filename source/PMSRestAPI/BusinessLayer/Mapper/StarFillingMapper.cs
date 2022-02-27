using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Mapper
{
    public class StarFillingMapper:IMapper<List<studentdailyperformance>,StarWisePerformance>
    {
        public StarWisePerformance Map(List<studentdailyperformance> dailyPerformances)
        {
            StarWisePerformance starData = new StarWisePerformance();
            double attendance = 0;
            double homework = 0;
            double discipline = 0;
            starData.StarAttendance = new List<string>();
            starData.StarHomework = new List<string>();
            starData.StarDiscipline = new List<string>();

            foreach(var daily in dailyPerformances)
            {

                if(daily.Attendance == 1)
                {
                    starData.Attendance = starData.Attendance +1;
                }
                if (daily.HomeWork == 1)
                {
                    starData.Homework = starData.Homework + 1;
                }
                if (daily.Discipline == 1)
                {
                    starData.Discipline = starData.Discipline + 1;
                }

                starData.MonthlyTotal = starData.MonthlyTotal + 1;

            }


            for(int i=1; i<=31;i++)
            {
                attendance = 0;
                homework = 0;
                discipline = 0;
                int total = 0;

                var daywise = dailyPerformances.Where(d => d.day == i);
                if(daywise.Count() <1)
                {
                    starData.StarAttendance.Add("blue");
                    starData.StarHomework.Add("blue");
                    starData.StarDiscipline.Add("blue");
                }
                else
                {
                    foreach (var perfom in daywise)
                    {
                        total = total + 1;
                        attendance = attendance + (perfom.Attendance == 1 ? 1 : 0);
                        homework = homework + (perfom.HomeWork == 1 ? 1 : 0);
                        discipline = discipline + (perfom.Discipline == 1 ? 1 : 0);
                    }

                    if (attendance / total == 1)
                    {
                        starData.StarAttendance.Add("green");
                    }
                    else if (attendance / total >=0.75)
                    {
                        starData.StarAttendance.Add("yellow");
                    }
                    else if (attendance / total < 0.75)
                    {
                        starData.StarAttendance.Add("red");
                    }

                    if (homework / total == 1)
                    {
                        starData.StarHomework.Add("green");
                    }
                    else if (homework / total >= 0.75)
                    {
                        starData.StarHomework.Add("yellow");
                    }
                    else if (homework / total < 0.75)
                    {
                        starData.StarHomework.Add("red");
                    }

                    if (discipline / total == 1)
                    {
                        starData.StarDiscipline.Add("green");
                    }
                    else if (discipline / total >= 0.75)
                    {
                        starData.StarDiscipline.Add("yellow");
                    }
                    else if (discipline / total < 0.75)
                    {
                        starData.StarDiscipline.Add("red");
                    }
                }
               

            }

            return starData;
        }
    }
}
