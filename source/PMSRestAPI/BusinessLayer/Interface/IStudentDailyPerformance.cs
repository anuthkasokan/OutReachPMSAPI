using BusinessLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface IStudentDailyPerformance<TModel1,TModel2,TModel3,TModel4>
    {
        List<TModel1> GetPerformancesByCityId(int cityid);

        List<TModel2> GetPerformancesBySchoolId(int schoolid);

        List<TModel3> GetStudentsPerformances(int schoolid, int classid);

        List<TModel3> GetIndividualPerformanceList(int studentId);

        List<TModel4> GetSchoolWiseGroupPerformance(int schoolid);

        List<TModel4> GetClassWiseGroupPerformance(int schoolid, int classid);

        List<ClassWisePerformance> GetClassWisePerformanceForGroup(int groupid);

        List<TModel3> GetStudenWiseWisePerformanceForGroup(int groupid, int schoolid, int classid);

        List<TModel3> GetIndividualDateWise(string date, int schoolid, int classid);

        int InsertPerformanceData(string attendance, string discipline, string homework, int classId, int schoolId, string entryDate, List<StudentWisePerformance> studentPerformanceList);

        string GetMaxMonth(int schoolid, int classid);

        string GetMaxMonth(int cityId);

        string GetMaxMonthForSchool(int schoolid);
    }
}
