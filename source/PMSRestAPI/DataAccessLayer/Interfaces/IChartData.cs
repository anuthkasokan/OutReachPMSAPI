using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IChartData
    {
        List<studentdailyperformance> GetCityDataForChart(int cityid, int monthid);
        List<studentdailyperformance> GetSchoolDataForChart(int schoolid, int monthid);
        List<studentdailyperformance> GetClassDataForChart(int schoolid, int classid, int monthid);
        List<studentdailyperformance> GetStudentDataForChart(int studentid, int monthid);
        List<studentdailyperformance> GetGroupDataForChart(int groupid, int monthid);
        List<studentdailyperformance> GetGroupDataForChart(int groupid, int classid, int monthid);
        List<string> GetMonths();
    }
}
