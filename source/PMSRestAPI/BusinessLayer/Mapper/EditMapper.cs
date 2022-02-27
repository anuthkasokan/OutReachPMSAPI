using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using BusinessLayer.Model;
using BusinessLayer.Interface;

namespace BusinessLayer.Mapper
{
    public class EditMapper : IMapper<AddPerformanceData,List<parameterschoolmap>>, IMapper2<StudentWisePerformance,string,studentdailyperformance>
    {
        public List<parameterschoolmap> Map(AddPerformanceData performanceData)
        {
            List<parameterschoolmap> parameterList = new List<parameterschoolmap>();

            parameterschoolmap parameter = new parameterschoolmap();
            parameter.schoolid = performanceData.SchoolId;
            parameter.parameterid = 1;
            parameter.alterparameter = performanceData.Attendance;
            parameter.status = true;
            parameter.created_on = DateTime.Now;
            parameterList.Add(parameter);

            parameter = new parameterschoolmap();
            parameter.schoolid = performanceData.SchoolId;
            parameter.parameterid = 2;
            parameter.alterparameter = performanceData.Discipline;
            parameter.status = true;
            parameter.created_on = DateTime.Now;
            parameterList.Add(parameter);

            parameter = new parameterschoolmap();
            parameter.schoolid = performanceData.SchoolId;
            parameter.parameterid = 3;
            parameter.alterparameter = performanceData.Homework;
            parameter.status = true;
            parameter.created_on = DateTime.Now;
            parameterList.Add(parameter);

            return parameterList;
        }

        public studentdailyperformance Map(StudentWisePerformance studentWisePerformance,string entryDate)
        {

                studentdailyperformance dailyperformance = new studentdailyperformance();

                var date = Convert.ToDateTime(entryDate);

                dailyperformance.Attendance = studentWisePerformance.Attendance;
                dailyperformance.Discipline = studentWisePerformance.Discipline;
                dailyperformance.HomeWork = studentWisePerformance.Homework;
                dailyperformance.studentschoolmapid = studentWisePerformance.StudentSchoolMapId;
                dailyperformance.day = date.Day;
                dailyperformance.monthid = date.Month;
                dailyperformance.yearid = 1;
                dailyperformance.created_on = DateTime.Now;

            return dailyperformance;
        }
    }
}
