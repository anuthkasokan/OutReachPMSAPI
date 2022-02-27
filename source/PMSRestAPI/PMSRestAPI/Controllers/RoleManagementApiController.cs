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
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    [RoutePrefix("api/roles")]
    public class RoleManagementApiController : ApiController
    {
        private IGetDetails<User> _userDetails;
        private IUserRole<Role> _rolesDetails;

        public RoleManagementApiController()
        {
            _rolesDetails = new UserRolesDetails();
            _userDetails = new UserDetails();
        }

        // GET api/details/roles
        [Route("roles")]
        public HttpResponseMessage GetRoles()
        {
            var roles = _rolesDetails.GetDetails();
            return HttpResponse(roles);
        }

        // GET api/details/roles
        [Route("roles/{id}")]
        public HttpResponseMessage GetRoles(int id)
        {
            var rolesbyuserid = _rolesDetails.GetDetails(id);
            return HttpResponse(rolesbyuserid);
        }

        // GET api/details/users
        [Route("users")]
        public HttpResponseMessage GetUsers()
        {
            var users = _userDetails.GetDetails();
            return HttpResponse(users);
        }

        [Route("save")]
        public HttpResponseMessage UpdateRole(User userDetails)
        {
            int result = _rolesDetails.SaveRole(userDetails);
            return HttpResponse(result);
        }

        private HttpResponseMessage HttpResponse(object model)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK, model, Configuration.Formatters.JsonFormatter);
            Response.AddHeader(response);
            return response;
        }
    }
}