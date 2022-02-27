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
    public class StudentWisePerformanceMapper: IMapper2<student, List<studentdailyperformance>, StudentWisePerformance>, IMapper<studentdailyperformance,StudentWisePerformance>, IMapper2<student,studentdailyperformance, StudentWisePerformance>
    {


        public StudentWisePerformance Map(student studentIn, List<studentdailyperformance> dailyPerformancesIn)
        {
            StudentWisePerformance performanceDetails = new StudentWisePerformance();
            performanceDetails.StudentId = studentIn.studentid;
            performanceDetails.StudentName = studentIn.studentname;
            performanceDetails.RollNumber = studentIn.studentschoolmaps.Where(p =>p.studentid ==studentIn.studentid).FirstOrDefault().rollnumber;

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

                var totalPerform = Convert.ToInt32(singleDayPerformance.Attendance) * 5 + Convert.ToInt32(singleDayPerformance.Discipline) * 5 + Convert.ToInt32(singleDayPerformance.HomeWork) * 5;
                performanceDetails.Points = totalPerform == 15 ? performanceDetails.Points + totalPerform + 5 : performanceDetails.Points + totalPerform;
            }

            return performanceDetails;
        }

        public StudentWisePerformance Map(studentdailyperformance dailyPerformanceIn)
        {
            StudentWisePerformance performanceDetails = new StudentWisePerformance();
            performanceDetails.Date = dailyPerformanceIn.day+"/"+dailyPerformanceIn.monthid+"/"+ DateTime.Now.Year;
            performanceDetails.Attendance = Convert.ToInt32(dailyPerformanceIn.Attendance);
            performanceDetails.Discipline = Convert.ToInt32(dailyPerformanceIn.Discipline);
            performanceDetails.Homework = Convert.ToInt32(dailyPerformanceIn.HomeWork);
            performanceDetails.Points = Convert.ToInt32(dailyPerformanceIn.Attendance)*5 + Convert.ToInt32(dailyPerformanceIn.Discipline)*5 + Convert.ToInt32(dailyPerformanceIn.HomeWork)*5;

            performanceDetails.Points = performanceDetails.Points == 15 ? performanceDetails.Points + 5 : performanceDetails.Points;

            return performanceDetails;
        }

        public StudentWisePerformance Map(student studentIn, studentdailyperformance performanceIn)
        {
            StudentWisePerformance performanceDetails = new StudentWisePerformance();
            performanceDetails.StudentId = studentIn.studentid;
            performanceDetails.StudentName = studentIn.studentname;
            performanceDetails.RollNumber = studentIn.studentschoolmaps.Where(p => p.studentid == studentIn.studentid).FirstOrDefault().rollnumber;
            performanceDetails.Attendance = performanceIn != null? Convert.ToInt32(performanceIn.Attendance):0;
            performanceDetails.Discipline = performanceIn != null ? Convert.ToInt32(performanceIn.Discipline):0;
            performanceDetails.Homework = performanceIn != null ? Convert.ToInt32(performanceIn.HomeWork):0;
           
            return performanceDetails;
        }

    }
}
