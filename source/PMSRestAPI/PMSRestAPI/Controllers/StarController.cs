using BusinessLayer.BusinessAccess;
using BusinessLayer.Common;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace PMSRestAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    [RoutePrefix("api/star")]
    public class StarController : ApiController
    {
        private IStarDetails<StarWisePerformance>  _GetStarDetails;

        public StarController()
        {
            _GetStarDetails = new StarDetails();
        }

        [Route("{cityid}")]
        public HttpResponseMessage GetStarForCity(int cityid)
        {
            var starForSchool = _GetStarDetails.GetDetailsForCity(cityid);
            return HttpResponse(starForSchool);
        }

        [Route("school/{schoolid}")]
        public HttpResponseMessage GetStarForSchool(int schoolid)
        {
            var starForSchool = _GetStarDetails.GetDetails(schoolid);
            return HttpResponse(starForSchool);
        }

        [Route("class/{schoolid}/{classid}")]
        public HttpResponseMessage GetStarForClass(int schoolid,int classid)
        {
            var starForSchool = _GetStarDetails.GetDetails(schoolid,classid);
            return HttpResponse(starForSchool);
        }

        [Route("student/{studentid}")]
        public HttpResponseMessage GetStarForStudent(int studentid)
        {
            var starForSchool = _GetStarDetails.GetDetailsForStudent(studentid);
            return HttpResponse(starForSchool);
        }

        [Route("group/{groupid}")]
        public HttpResponseMessage GetStarForGroup(int groupid)
        {
            var starForSchool = _GetStarDetails.GetDetailsForGroup(groupid);
            return HttpResponse(starForSchool);
        }

        [Route("group/{groupid}/{classid}")]
        public HttpResponseMessage GetStarForGroup(int groupid,int classid)
        {
            var starForSchool = _GetStarDetails.GetGroupDetailsForClass(groupid,classid);
            return HttpResponse(starForSchool);
        }

        private HttpResponseMessage HttpResponse(object model)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK, model, Configuration.Formatters.JsonFormatter);
            Response.AddHeader(response);
            return response;
        }
    }
}