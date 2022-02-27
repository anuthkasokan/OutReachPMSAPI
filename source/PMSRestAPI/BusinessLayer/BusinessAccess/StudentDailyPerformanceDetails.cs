using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using BusinessLayer.Mapper;

namespace BusinessLayer.BusinessAccess
{
    public class StudentDailyPerformanceDetails : IStudentDailyPerformance<SchoolWisePerformance, ClassWisePerformance, StudentWisePerformance, GroupWisePerformance>
    {
        private ISchoolData<school> _schoolData;
        private IGetDatas<@class> _classData;
        private IStudentData<student> _studentData;
        private IPerformanceData<studentdailyperformance> _studentDailyPerformance;
        private IGetDatasById<group> _groupDataForSchool;
        private IMapper2<school, List<studentdailyperformance>, SchoolWisePerformance> _schoolPerformanceMapper;
        private IMapper2<@class, List<studentdailyperformance>, ClassWisePerformance> _classPerformanceMapper;
        private IMapper2<student, List<studentdailyperformance>, StudentWisePerformance> _studentPerformanceMapper;
        private IMapper<studentdailyperformance, StudentWisePerformance> _individualPerformanceMapper;
        private IMapper2<student, studentdailyperformance, StudentWisePerformance> _studentPerformanceByDateMapper;
        private IMapper2<group, List<studentdailyperformance>, GroupWisePerformance> _groupPerformanceMapper;
        private IMapper<AddPerformanceData, List<parameterschoolmap>> _alterParamMapper;
        private IMapper2<StudentWisePerformance, string, studentdailyperformance> _editMapper;
        private IMapper<studentschoolmap, StudentSchoolMap> _studentSchoolmapMapper;

        public StudentDailyPerformanceDetails()
        {
            _schoolData = new SchoolData();
            _classData = new ClassData();
            _studentData = new StudentData();
            _groupDataForSchool = new GroupData();
            _studentDailyPerformance = new StudentDailyPerformanceData();
            _schoolPerformanceMapper = new SchoolWisePerformanceMapper();
            _classPerformanceMapper = new ClassWisePerformanceMapper();
            _studentPerformanceMapper = new StudentWisePerformanceMapper();
            _individualPerformanceMapper = new StudentWisePerformanceMapper();
            _groupPerformanceMapper = new GroupWisePerformanceMapper();
            _studentPerformanceByDateMapper = new StudentWisePerformanceMapper();
            _alterParamMapper = new EditMapper();
            _editMapper = new EditMapper();
            _studentSchoolmapMapper = new StudentMapper();

        }

        public List<SchoolWisePerformance> GetPerformancesByCityId(int cityid)
        {
            List<SchoolWisePerformance> schoolWisePerformances = new List<SchoolWisePerformance>();

            var schoolList = _schoolData.GetDataByCityID(cityid);

            foreach (var school in schoolList)
            {
                var dailyPerformance = _studentDailyPerformance.GetDataBySchoolID(school.schoolid);

                schoolWisePerformances.Add(_schoolPerformanceMapper.Map(school, dailyPerformance));
            }

            return schoolWisePerformances;

        }

        public List<ClassWisePerformance> GetPerformancesBySchoolId(int schoolid)
        {
            List<ClassWisePerformance> classWisePerformances = new List<ClassWisePerformance>();

            var classList = _classData.GetData();

            foreach (var @class in classList)
            {
                var dailyPerformance = _studentDailyPerformance.GetDataByClassID(schoolid, @class.classid);

                classWisePerformances.Add(_classPerformanceMapper.Map(@class, dailyPerformance));
            }

            return classWisePerformances;
        }

        public List<StudentWisePerformance> GetStudentsPerformances(int schoolid, int classid)
        {
            List<StudentWisePerformance> studentWisePerformances = new List<StudentWisePerformance>();

            var studentsList = _studentData.GetData(schoolid, classid);

            foreach (var student in studentsList)
            {
                var dailyPerformance = _studentDailyPerformance.GetDataByStudentID(student.studentid);

                studentWisePerformances.Add(_studentPerformanceMapper.Map(student, dailyPerformance));
            }

            return studentWisePerformances;
        }

        public List<StudentWisePerformance> GetIndividualPerformanceList(int studentid)
        {
            List<StudentWisePerformance> studentDailyPerformances = new List<StudentWisePerformance>();

            var dailyPerformance = _studentDailyPerformance.GetDataByStudentID(studentid);

            foreach (var performance in dailyPerformance)
            {

                studentDailyPerformances.Add(_individualPerformanceMapper.Map(performance));
            }

            return studentDailyPerformances;
        }

        public List<GroupWisePerformance> GetSchoolWiseGroupPerformance(int schoolid)
        {
            List<GroupWisePerformance> groupPerformances = new List<GroupWisePerformance>();

            var groupDetails = _groupDataForSchool.GetData(schoolid);

            foreach (var group in groupDetails)
            {
                var groupPerformance = _studentDailyPerformance.GetGroupDataByGroupID(group.groupid);

                groupPerformances.Add(_groupPerformanceMapper.Map(group, groupPerformance));
            }

            return groupPerformances;
        }

        public List<GroupWisePerformance> GetClassWiseGroupPerformance(int schoolid, int classid)
        {
            List<GroupWisePerformance> groupPerformances = new List<GroupWisePerformance>();

            var groupDetails = _groupDataForSchool.GetData(schoolid);

            foreach (var group in groupDetails)
            {
                var groupPerformance = _studentDailyPerformance.GetGroupDataByGroupID(group.groupid, classid);

                groupPerformances.Add(_groupPerformanceMapper.Map(group, groupPerformance));
            }

            return groupPerformances;
        }

        public List<ClassWisePerformance> GetClassWisePerformanceForGroup(int groupid)
        {
            List<ClassWisePerformance> groupPerformances = new List<ClassWisePerformance>();

            var classList = _classData.GetData();

            foreach (var @class in classList)
            {
                var groupPerformance = _studentDailyPerformance.GetGroupDataByGroupID(groupid, @class.classid);

                groupPerformances.Add(_classPerformanceMapper.Map(@class, groupPerformance));
            }

            return groupPerformances;
        }

        public List<StudentWisePerformance> GetStudenWiseWisePerformanceForGroup(int groupid, int schoolid, int classid)
        {
            List<StudentWisePerformance> groupPerformances = new List<StudentWisePerformance>();

            var studenList = _studentData.GetGroupData(groupid,classid);

            foreach (var student in studenList)
            {
                var groupPerformance = _studentDailyPerformance.GetGroupDataByStudentID(groupid, student.studentid);

                groupPerformances.Add(_studentPerformanceMapper.Map(student, groupPerformance));
            }

            return groupPerformances;
        }

        public List<StudentWisePerformance> GetIndividualDateWise(string date, int schoolid, int classid)
        {
            List<StudentWisePerformance> studentDailyPerformances = new List<StudentWisePerformance>();

            var studentList = _studentData.GetData(schoolid, classid);

            foreach (var student in studentList)
            {
                var performance = _studentDailyPerformance.GetStudentPerformancesByDate(Convert.ToDateTime(date), student.studentid);

                studentDailyPerformances.Add(_studentPerformanceByDateMapper.Map(student, performance));
            }

            return studentDailyPerformances;
        }

        public int InsertPerformanceData(string attendance, string discipline, string homework, int classId, int schoolId, string entryDate, List<StudentWisePerformance> studentPerformanceList)
        {
            int result = 0;

            AddPerformanceData performanceData = new AddPerformanceData();
            performanceData.Attendance = attendance;
            performanceData.Discipline = discipline;
            performanceData.Homework = homework;
            performanceData.ClassId = classId;
            performanceData.SchoolId = schoolId;
            performanceData.EntryDate = entryDate;
            performanceData.StudentList = studentPerformanceList;

            result = +_studentDailyPerformance.InsertAlterParameter(_alterParamMapper.Map(performanceData));

            List<studentdailyperformance> studentsPerformanceList = new List<studentdailyperformance>();

            foreach (var student in performanceData.StudentList)
            {
                student.StudentSchoolMapId = Convert.ToInt32(_studentDailyPerformance.GetStudentSchoolMapDetails(student.StudentId).studentschoolmapid);

                studentsPerformanceList.Add(_editMapper.Map(student,entryDate));
            }

            result = +_studentDailyPerformance.InsertDailyPerformancesFromUI(studentsPerformanceList);

            return result;
        }

        public string GetMaxMonth(int schoolid, int classid)
        {
            string month = _studentDailyPerformance.GetMaxMonth(schoolid, classid);
            return month;
        }

        public string GetMaxMonth(int cityId)
        {
            string month = _studentDailyPerformance.GetMaxMonth(cityId);
            return month;
        }

        public string GetMaxMonthForSchool(int schoolid)
        {
            string month = _studentDailyPerformance.GetMaxMonth(schoolid);
            return month;
        }

    }
}
