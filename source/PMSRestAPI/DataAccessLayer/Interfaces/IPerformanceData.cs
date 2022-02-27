using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IPerformanceData<TModel>
    {
        List<TModel> GetDataByCityID(int cityid);

        List<TModel> GetDataBySchoolID(int schoolid);

        List<TModel> GetDataByClassID(int schoolid,int classid);

        List<TModel> GetDataByStudentID(int studentid);

        List<TModel> GetGroupDataByGroupID(int groupId);

        List<TModel> GetGroupDataByGroupID(int groupid, int classid);

        List<TModel> GetGroupDataByStudentID(int groupid, int studentid);

        int GetStudentSchoolMapId(string rollNumber, int schoolId, int classId);

        int InsertAlterParameter(int parameterId,int schoolId, string alterParameter);

        int DuplicateCheckForBulkUploadPerformanceData(int schoolId,int classId, int monthId, int yearId,int day);

        TModel GetStudentPerformancesByDate(DateTime date, int studentid);

        int InsertAlterParameter(List<parameterschoolmap> alterparameterList);

        int InsertDailyPerformancesFromUI(List<studentdailyperformance> studentdailyperformances);

        studentschoolmap GetStudentSchoolMapDetails(int studentId);

        string GetMaxMonth(int schoolid, int classid);

        string GetMaxMonth(int cityId);

        string GetMaxMonthForSchool(int schoolid);
    }
}
