using BusinessLayer.BusinessAccess;
using BusinessLayer.Common;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace PMSRestAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers:"*",methods:"*")]
    [RoutePrefix("api/details")]
    public class DetailsController : ApiController
    {
        private IAuthenticationDetails _authenticateUser;
        private IGetDetails<User> _userDetails;
        private IGetDetails<City> _cityDetails;
        IStudentDailyPerformance<SchoolWisePerformance, ClassWisePerformance, StudentWisePerformance,GroupWisePerformance> _studentPerformanceDetails;
        private ISchoolDetails<School> _schoolDetails;
        private IGetDetails<Class> _classDetails;
        private IGetDetailsById<Group> _groupDetails;
        private IGetDetailsBy2Id<Student> _studentDetails;

        public DetailsController()
        {
            _authenticateUser = new AuthenticationDetails();
            _userDetails = new UserDetails();
            _cityDetails = new CityDetails();
            _schoolDetails = new SchoolDetails();
            _classDetails = new ClassDetails();
            _studentDetails = new StudentDetails();
            _groupDetails = new GroupDetails();
            _studentPerformanceDetails = new StudentDailyPerformanceDetails();
        }

        [Route("{emailid}/{password}")]
        public HttpResponseMessage GetCredentials(string emailid,string password)
        {
            var userDetails = _authenticateUser.CheckCredentials(emailid,password);
            return HttpResponse(userDetails);
        }


        [Route("cities")]
        public HttpResponseMessage GetCityList()
        {
            var cities = _cityDetails.GetDetails();
            return HttpResponse(cities);
        }


        [Route("schools/{id}")]
        public HttpResponseMessage GetSchoolList(int id)
        {
            var schools = _schoolDetails.GetSchoolListById(id);
            return HttpResponse(schools);
        }

        [Route("schools")]
        public HttpResponseMessage GetSchoolList()
        {
            var schools = _schoolDetails.GetSchoolList();
            return HttpResponse(schools);
        }

        [Route("schoolsforcity/{id}")]
        public HttpResponseMessage GetSchoolListForCity(int id)
        {
            var schools = _studentPerformanceDetails.GetPerformancesByCityId(id);
            return HttpResponse(schools);
        }

        [Route("classes")]
        public HttpResponseMessage GetClassList()
        {
            var classes = _classDetails.GetDetails();
            return HttpResponse(classes);
        }

        [Route("classesforschool/{id}")]
        public HttpResponseMessage GetClassesForSchool(int id)
        {
            var schools = _studentPerformanceDetails.GetPerformancesBySchoolId(id);
            return HttpResponse(schools);
        }

        [Route("students/{schoolid}/{classid}")]
        public HttpResponseMessage GetStudentList(int schoolid,int classid)
        {
            var students = _studentDetails.GetDetails(schoolid,classid);
            return HttpResponse(students);
        }

        [Route("studentsforclass/{schoolid}/{classid}")]
        public HttpResponseMessage GetStudentListForClass(int schoolid, int classid)
        {
            var students = _studentPerformanceDetails.GetStudentsPerformances(schoolid,classid);
            return HttpResponse(students);
        }

        [Route("individual/{studentid}")]
        public HttpResponseMessage GetIndividualPerformance(int studentid)
        {
            var students = _studentPerformanceDetails.GetIndividualPerformanceList(studentid);
            return HttpResponse(students);
        }

        [Route("group/{schoolid}")]
        public HttpResponseMessage GetGroupList(int schoolid)
        {
            var groupDetails = _groupDetails.GetDetails(schoolid);
            return HttpResponse(groupDetails);
        }

        [Route("groupperformance/{schoolid}")]
        public HttpResponseMessage GetGroupPerformanceForSchool(int schoolid)
        {
            var groupDetails = _studentPerformanceDetails.GetSchoolWiseGroupPerformance(schoolid);
            return HttpResponse(groupDetails);
        }

        [Route("group/{schoolid}/{classid}")]
        public HttpResponseMessage GetGroupPerformanceForClass(int schoolid, int classid)
        {
            var groupDetails = _studentPerformanceDetails.GetClassWiseGroupPerformance(schoolid,classid);
            return HttpResponse(groupDetails);
        }

        [Route("classwisegroup/{groupid}")]
        public HttpResponseMessage GetClassWiseGroupPerformance(int groupid)
        {
            var groupDetails = _studentPerformanceDetails.GetClassWisePerformanceForGroup(groupid);
            return HttpResponse(groupDetails);
        }

        [Route("studentwisegroup/{groupid}/{schoolid}/{classid}")]
        public HttpResponseMessage GetStudentWiseGroupPerformance(int groupid,int schoolid,int classid)
        {
            var groupDetails = _studentPerformanceDetails.GetStudenWiseWisePerformanceForGroup(groupid,schoolid,classid);
            return HttpResponse(groupDetails);
        }

        [Route("alter/{schoolid}")]
        public HttpResponseMessage GetAlterParameters(int schoolid)
        {
            var parameters = _schoolDetails.GetAlterParameters(schoolid);
            return HttpResponse(parameters);
        }

        [Route("studentBydate/{schoolid}/{classid}/{date}")]
        public HttpResponseMessage GetStudentListForEdit(int schoolid,int classid, string date)
        {
            var studentList = _studentPerformanceDetails.GetIndividualDateWise(date,schoolid,classid);
            return HttpResponse(studentList);
        }

  
        [Route("save/{attendance}/{discipline}/{homework}/{classId}/{schoolId}/{entryDate}")]
        public HttpResponseMessage SaveData(string attendance, string discipline,string homework, int classId, int schoolId,string entryDate, List<StudentWisePerformance> studentPerformanceList)
        {
            int result = _studentPerformanceDetails.InsertPerformanceData(attendance, discipline, homework, classId, schoolId, entryDate, studentPerformanceList);

            return HttpResponse(result);
        }

        [Route("getmonth/{schoolid}/{classid}")]
        public HttpResponseMessage GetMaxMonth(int schoolid,int classid)
        {
            var month = _studentPerformanceDetails.GetMaxMonth(schoolid, classid);
            return HttpResponse(month);
        }

        [Route("getmonth/{cityid}")]
        public HttpResponseMessage GetMaxMonth(int cityid)
        {
            var month = _studentPerformanceDetails.GetMaxMonth(cityid);
            return HttpResponse(month);
        }

        [Route("getmonthforschool/{schoolid}")]
        public HttpResponseMessage GetMaxMonthForSchool(int schoolid)
        {
            var month = _studentPerformanceDetails.GetMaxMonthForSchool(schoolid);
            return HttpResponse(month);
        }

        private HttpResponseMessage HttpResponse(object model)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK, model, Configuration.Formatters.JsonFormatter);
            Response.AddHeader(response);
            return response;
        }
    }
}
