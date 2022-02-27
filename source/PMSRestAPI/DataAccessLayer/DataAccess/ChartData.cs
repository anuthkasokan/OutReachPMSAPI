using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;

namespace DataAccessLayer.DataAccess
{
    public class ChartData:IChartData
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();

        public List<studentdailyperformance> GetCityDataForChart(int cityid, int monthid)
        {
            var performanceDetails = from sp in pmsDb.studentdailyperformances
                                     join sm in pmsDb.studentschoolmaps on sp.studentschoolmapid equals sm.studentschoolmapid
                                     join mo in pmsDb.months on sp.monthid equals mo.monthid
                                     join ci in pmsDb.schools on sm.schoolid equals ci.schoolid
                                     where mo.monthid == monthid && ci.cityid == cityid
                                     select sp;

            return performanceDetails.ToList();
        }

        public List<studentdailyperformance> GetSchoolDataForChart(int schoolid, int monthid)
        {
            var performanceDetails = from sp in pmsDb.studentdailyperformances
                                     join sm in pmsDb.studentschoolmaps on sp.studentschoolmapid equals sm.studentschoolmapid
                                     join mo in pmsDb.months on sp.monthid equals mo.monthid
                                     where mo.monthid == monthid && sm.schoolid == schoolid
                                     select sp;

            return performanceDetails.ToList();
        }

        public List<studentdailyperformance> GetClassDataForChart(int schoolid,int classid, int monthid)
        {
            var performanceDetails = from sp in pmsDb.studentdailyperformances
                                     join sm in pmsDb.studentschoolmaps on sp.studentschoolmapid equals sm.studentschoolmapid
                                     join mo in pmsDb.months on sp.monthid equals mo.monthid
                                     where mo.monthid == monthid && sm.classid==classid && sm.schoolid==schoolid
                                     select sp;

            return performanceDetails.ToList();
        }

        public List<studentdailyperformance> GetStudentDataForChart(int studentid, int monthid)
        {
            var performanceDetails = from sp in pmsDb.studentdailyperformances
                                     join sm in pmsDb.studentschoolmaps on sp.studentschoolmapid equals sm.studentschoolmapid
                                     join mo in pmsDb.months on sp.monthid equals mo.monthid
                                     where mo.monthid == monthid && sm.studentid == studentid
                                     select sp;

            return performanceDetails.ToList();
        }

        public List<studentdailyperformance> GetGroupDataForChart(int groupid, int monthid)
        {
            var performanceDetails = from sp in pmsDb.studentdailyperformances
                                     join sm in pmsDb.studentschoolmaps on sp.studentschoolmapid equals sm.studentschoolmapid
                                     join mo in pmsDb.months on sp.monthid equals mo.monthid
                                     where mo.monthid == monthid && sm.groupid==groupid
                                     select sp;

            return performanceDetails.ToList();
        }

        public List<studentdailyperformance> GetGroupDataForChart(int groupid,int classid, int monthid)
        {
            var performanceDetails = from sp in pmsDb.studentdailyperformances
                                     join sm in pmsDb.studentschoolmaps on sp.studentschoolmapid equals sm.studentschoolmapid
                                     join mo in pmsDb.months on sp.monthid equals mo.monthid
                                     where mo.monthid == monthid && sm.groupid == groupid && sm.classid==classid
                                     select sp;

            return performanceDetails.ToList();
        }

        public List<string> GetMonths()
        {

            var lastSixMonths = Enumerable
                .Range(0, 6)
                .Select(i => DateTime.Now.AddMonths(i - 6))
                .Select(date => date.ToString("MM/yyyy"));

            return lastSixMonths.ToList();
         
        }

    }
}
