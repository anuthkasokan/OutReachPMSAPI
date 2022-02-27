using BusinessLayer.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using BusinessLayer.BusinessAccess;
using BusinessLayer.Common;

namespace PMSRestAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    [RoutePrefix("api/chart")]
    public class PerformanceMetricsController : ApiController
    {
        private IChartDetails _chartDetails;

        public PerformanceMetricsController()
        {
            _chartDetails = new ChartDetails();
        }

        [Route("{cityid}")]
        public HttpResponseMessage GetCityPerformanceMetrics(int cityid)
        {
            var performanceChartDetails = _chartDetails.GetPointsForCityChart(cityid);
            return HttpResponse(performanceChartDetails);
        }

        [Route("school/{schoolid}")]
        public HttpResponseMessage GetSchoolPerformanceMetrics(int schoolid)
        {
            var performanceChartDetails = _chartDetails.GetPointsForSchoolChart(schoolid);
            return HttpResponse(performanceChartDetails);
        }

        [Route("{schoolid}/{classid}")]
        public HttpResponseMessage GetClassPerformanceMetrics(int schoolid,int classid)
        {
            var performanceChartDetails = _chartDetails.GetPointsForClassChart(schoolid,classid);
            return HttpResponse(performanceChartDetails);
        }
        [Route("student/{studentid}")]
        public HttpResponseMessage GetStudentPerformanceMetrics(int studentid)
        {
            var performanceChartDetails = _chartDetails.GetPointsForStudentChart(studentid);
            return HttpResponse(performanceChartDetails);
        }
        [Route("group/{groupid}")]
        public HttpResponseMessage GetGroupSchoolWisePerformanceMetrics(int groupid)
        {
            var performanceChartDetails = _chartDetails.GetPointsForGroupChart(groupid);
            return HttpResponse(performanceChartDetails);
        }
        [Route("group/{groupid}/{classid}")]
        public HttpResponseMessage GetGroupClassWisePerformanceMetrics(int groupid,int classid)
        {
            var performanceChartDetails = _chartDetails.GetPointsForClassWiseGroupChart(groupid,classid);
            return HttpResponse(performanceChartDetails);
        }
        [Route("months")]
        public HttpResponseMessage GetMonths()
        {
            var monthsForChartDetails = _chartDetails.GetMonthsForChart();
            return HttpResponse(monthsForChartDetails);
        }

        [Route("inc/{cityid}")]
        public HttpResponseMessage GetIncreaseInCity(int cityid)
        {
            var increaseInPerformance = _chartDetails.GetIncreaseInPerForCity(cityid);
            return HttpResponse(increaseInPerformance);
        }

        [Route("inc/school/{schoolid}")]
        public HttpResponseMessage GetIncreaseInSchool(int schoolid)
        {
            var increaseInPerformance = _chartDetails.GetIncreaseInPerForSchool(schoolid);
            return HttpResponse(increaseInPerformance);
        }

        [Route("inc/class/{schoolid}/{classid}")]
        public HttpResponseMessage GetIncreaseInClass(int schoolid,int classid)
        {
            var increaseInPerformance = _chartDetails.GetIncreaseInPerForClass(schoolid,classid);
            return HttpResponse(increaseInPerformance);
        }

        [Route("inc/student/{studentid}")]
        public HttpResponseMessage GetIncreaseInStudent(int studentid)
        {
            var increaseInPerformance = _chartDetails.GetIncreaseInPerForStudent(studentid);
            return HttpResponse(increaseInPerformance);
        }

        [Route("inc/group/{groupid}")]
        public HttpResponseMessage GetIncreaseInGroupfromSchool(int groupid)
        {
            var increaseInPerformance = _chartDetails.GetIncreaseInPerForGroupForSchool(groupid);
            return HttpResponse(increaseInPerformance);
        }

        [Route("inc/group/{groupid}/{classid}")]
        public HttpResponseMessage GetIncreaseInGroupfromClass(int groupid, int classid)
        {
            var increaseInPerformance = _chartDetails.GetIncreaseInPerForGroupForClass(groupid,classid);
            return HttpResponse(increaseInPerformance);
        }

        private HttpResponseMessage HttpResponse(object model)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK, model, Configuration.Formatters.JsonFormatter);
            Response.AddHeader(response);
            return response;
        }
    }
}
