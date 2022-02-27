using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface IChartDetails
    {
        List<int> GetPointsForCityChart(int cityid);
        List<int> GetPointsForSchoolChart(int schoolid);

        List<int> GetPointsForClassChart(int schoolid, int classid);
        List<int> GetPointsForStudentChart(int studentid);
        List<int> GetPointsForGroupChart(int groupid);
        List<int> GetPointsForClassWiseGroupChart(int groupid, int classid);
        double GetIncreaseInPerForCity(int cityid);
        double GetIncreaseInPerForSchool(int schoolid);
        double GetIncreaseInPerForClass(int schoolid, int classid);
        double GetIncreaseInPerForStudent(int studentid);
        double GetIncreaseInPerForGroupForSchool(int groupid);
        double GetIncreaseInPerForGroupForClass(int groupid, int classid);
        List<string> GetMonthsForChart();
    }
}
