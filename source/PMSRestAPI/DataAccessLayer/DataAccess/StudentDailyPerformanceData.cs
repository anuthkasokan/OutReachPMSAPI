using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;

namespace DataAccessLayer.DataAccess
{
    public class StudentDailyPerformanceData : IPerformanceData<studentdailyperformance>, IGetPrimaryDetails
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();

        public StudentDailyPerformanceData()
        {

        }

        public List<studentdailyperformance> GetDataByCityID(int cityId)
        {
            var studentPerformanceDetails = from sd in pmsDb.studentdailyperformances
                                            join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                            join sc in pmsDb.schools on ss.schoolid equals sc.schoolid
                                            where sc.cityid == cityId && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                            && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                            select sd;
            return studentPerformanceDetails.ToList();
        }

        public List<studentdailyperformance> GetDataBySchoolID(int schoolid)
        {
            var studentPerformanceDetails = from sd in pmsDb.studentdailyperformances
                                            join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                            where ss.schoolid == schoolid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                            && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                            select sd;
            return studentPerformanceDetails.ToList();
        }

        public List<studentdailyperformance> GetDataByClassID(int schoolid, int classid)
        {
            var studentPerformanceDetails = from sd in pmsDb.studentdailyperformances
                                            join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                            where ss.schoolid == schoolid && ss.classid == classid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                            && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                            select sd;
            return studentPerformanceDetails.ToList();
        }

        public List<studentdailyperformance> GetDataByStudentID(int studentid)
        {
            var studentPerformanceDetails = from sd in pmsDb.studentdailyperformances
                                            join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                            where ss.studentid == studentid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                            && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                            select sd;
            return studentPerformanceDetails.ToList();
        }

        public List<studentdailyperformance> GetGroupDataByGroupID(int groupid)
        {
            var groupPerformance = from sd in pmsDb.studentdailyperformances
                                   join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                   where ss.groupid == groupid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                   && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                   select sd;
            return groupPerformance.ToList();
        }

        public List<studentdailyperformance> GetGroupDataByGroupID(int groupid, int classid)
        {
            var groupPerformance = from sd in pmsDb.studentdailyperformances
                                   join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                   where ss.groupid == groupid && ss.classid == classid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                   && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                   select sd;
            return groupPerformance.ToList();
        }

        public List<studentdailyperformance> GetGroupDataByStudentID(int groupid, int studentid)
        {
            var groupPerformance = from sd in pmsDb.studentdailyperformances
                                   join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                   where ss.groupid == groupid && ss.studentid == studentid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                   && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                   select sd;
            return groupPerformance.ToList();
        }

        public int GetStudentSchoolMapId(string rollNumber, int schoolId, int classId)
        {
            var studentSchoolMapId = pmsDb.studentschoolmaps.Where(id => id.schoolid == schoolId
            && id.rollnumber == rollNumber && id.classid == classId).Select(mapid => mapid.studentschoolmapid).FirstOrDefault();
            return Convert.ToInt32(studentSchoolMapId);
        }

        public GetDataForExcelUpload_Result GetPrimaryDetails(string schoolName, string Class, string Month, string year)
        {
            var details = pmsDb.GetDataForExcelUpload(schoolName, Class, Month, year).FirstOrDefault();
            return details;

        }

        public int InsertAlterParameter(int parameterId, int schoolId, string alterParameter)
        {
            try
            {
                parameterschoolmap parameterschoolmap = new parameterschoolmap();
                parameterschoolmap = pmsDb.parameterschoolmaps.Where(id => id.parameterid == parameterId && id.schoolid == schoolId).Select(parametermap => parametermap).FirstOrDefault();
                if (parameterschoolmap != null)
                {
                    parameterschoolmap.alterparameter = alterParameter;
                    pmsDb.Entry(parameterschoolmap).State = System.Data.Entity.EntityState.Modified;
                }
                else
                {
                    parameterschoolmap parameterschool = new parameterschoolmap();
                    parameterschool.parameterid = parameterId;
                    parameterschool.schoolid = schoolId;
                    parameterschool.alterparameter = alterParameter;
                    parameterschool.status = true;
                    parameterschool.created_on = DateTime.Now;
                    pmsDb.parameterschoolmaps.Add(parameterschool);
                }
                pmsDb.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int InsertAlterParameter(List<parameterschoolmap> alterparameterList)
        {
            try
            {

                foreach (var parameter in alterparameterList)
                {
                    parameterschoolmap parameterschoolmap = new parameterschoolmap();
                    parameterschoolmap = pmsDb.parameterschoolmaps.Where(id => id.parameterid == parameter.parameterid && id.schoolid == parameter.schoolid).Select(parametermap => parametermap).FirstOrDefault();
                    if (parameterschoolmap != null)
                    {
                        parameterschoolmap.alterparameter = parameter.alterparameter;
                        pmsDb.Entry(parameterschoolmap).State = System.Data.Entity.EntityState.Modified;
                    }
                    else
                    {
                        parameterschoolmap parameterschool = new parameterschoolmap();
                        parameterschool.parameterid = parameter.parameterid;
                        parameterschool.schoolid = parameter.schoolid;
                        parameterschool.alterparameter = parameter.alterparameter;
                        parameterschool.status = true;
                        parameterschool.created_on = DateTime.Now;
                        pmsDb.parameterschoolmaps.Add(parameterschool);
                    }

                    pmsDb.SaveChanges();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int InsertDailyPerformancesFromUI(List<studentdailyperformance> studentdailyperformances)
        {
            try
            {

                foreach (var performance in studentdailyperformances)
                {
                    studentdailyperformance singleDayPerformance = new studentdailyperformance();
                    singleDayPerformance = pmsDb.studentdailyperformances.Where(id => id.day == performance.day && id.monthid == performance.monthid && id.yearid == performance.yearid && id.studentschoolmapid == performance.studentschoolmapid).FirstOrDefault();
                    if (singleDayPerformance != null)
                    {
                        singleDayPerformance.Attendance = performance.Attendance;
                        singleDayPerformance.Discipline = performance.Discipline;
                        singleDayPerformance.HomeWork = performance.HomeWork;

                        pmsDb.Entry(singleDayPerformance).State = System.Data.Entity.EntityState.Modified;
                    }
                    else
                    {
                        studentdailyperformance performanceAdd = new studentdailyperformance();
                        performanceAdd.Attendance = performance.Attendance;
                        performanceAdd.created_on = performance.created_on;
                        performanceAdd.day = performance.day;
                        performanceAdd.Discipline = performance.Discipline;
                        performanceAdd.HomeWork = performance.HomeWork;
                        performanceAdd.monthid = performance.monthid;
                        performanceAdd.studentschoolmapid = performance.studentschoolmapid;
                        performanceAdd.yearid = performance.yearid;

                        pmsDb.studentdailyperformances.Add(performanceAdd);
                    }

                    pmsDb.SaveChanges();
                }
                return 1;
            }
            catch(Exception ex)
            {
                return 0;
            }
        }

        public int DuplicateCheckForBulkUploadPerformanceData(int SchoolId, int ClassId, int month, int year, int day)
        {
            pmsDb.DuplicateCheckForPerformanceBulkUpload(SchoolId, ClassId, day, month, year);
            return 1;
        }

        public studentdailyperformance GetStudentPerformancesByDate(DateTime date, int studentid)
        {

            var dailyPerformance = from sd in pmsDb.studentdailyperformances
                                   join yr in pmsDb.performanceyears on sd.yearid equals yr.yearid
                                   join sm in pmsDb.studentschoolmaps on sd.studentschoolmapid equals sm.studentschoolmapid
                                   where sd.day == date.Day && sd.monthid == date.Month && yr.performanceyear1 == date.Year && sm.studentid== studentid
                                   select sd;

            return dailyPerformance.ToList().FirstOrDefault();
        }

        public studentschoolmap GetStudentSchoolMapDetails(int studentId)
        {
            var studentSchoolMap = from sm in pmsDb.studentschoolmaps
                                   where sm.studentid == studentId
                                   select sm;

            return studentSchoolMap.FirstOrDefault();
        }

        public string GetMaxMonth(int schoolid, int classid)
        {
            var month = from mo in pmsDb.months
                                            join sd in pmsDb.studentdailyperformances on mo.monthid equals sd.monthid
                                            join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                                            where ss.schoolid == schoolid && ss.classid == classid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                                            && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                                            select mo;

            return month.FirstOrDefault().monthname;
        }

        public string GetMaxMonth(int cityId)
        {
            var month = from mo in pmsDb.months
                        join sd in pmsDb.studentdailyperformances on mo.monthid equals sd.monthid
                        join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                        join sc in pmsDb.schools on ss.schoolid equals sc.schoolid
                        where sc.cityid== cityId && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                        && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                        select mo;

            return month.FirstOrDefault().monthname;
        }

        public string GetMaxMonthForSchool(int schoolid)
        {
            var month = from mo in pmsDb.months
                        join sd in pmsDb.studentdailyperformances on mo.monthid equals sd.monthid
                        join ss in pmsDb.studentschoolmaps on sd.studentschoolmapid equals ss.studentschoolmapid
                        where ss.schoolid == schoolid && sd.monthid == pmsDb.studentdailyperformances.Max(m => m.monthid)
                        && sd.yearid == pmsDb.studentdailyperformances.Max(m => m.yearid)
                        select mo;

            return month.FirstOrDefault().monthname;
        }

    }
}
