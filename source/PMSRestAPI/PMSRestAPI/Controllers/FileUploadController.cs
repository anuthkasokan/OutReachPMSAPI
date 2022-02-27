using BusinessLayer.BusinessAccess;
using BusinessLayer.Interface;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace PMSRestAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    [RoutePrefix("api/File")]
    public class FileUploadController : ApiController
    {
        private IFileManagement _fileManegement;
        private string fileName = string.Empty;
        public FileUploadController()
        {            
            _fileManegement = new FileManagement();
        }

        [Route("Upload")]
        [HttpPost]
        // GET api/<controller>
        public HttpResponseMessage Get()
        {
            HttpResponseMessage result = null;
            var response = "";
            int returnedVal = 0;
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 0)
            {
                var docfiles = new List<string>();
                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];

                    var filePath = HttpContext.Current.Server.MapPath("~/Files/" + postedFile.FileName);
                    fileName = postedFile.FileName;
                    postedFile.SaveAs(filePath);
                    docfiles.Add(filePath);
                    returnedVal = _fileManegement.UploadExcel(postedFile);
                    File.Delete(filePath);
                }
                if (returnedVal == 200)
                    response = "File uploded successfully...";
                else
                    response = "Upload stopped with file " + fileName + "and sheet name " + returnedVal;
                result = Request.CreateResponse(HttpStatusCode.Created, response);
            }
            else
            {
                result = Request.CreateResponse(HttpStatusCode.BadRequest);
            }
            return result;
        }

        [Route("UploadStudentDetails")]
        [HttpPost]
        // GET api/<controller>
        public HttpResponseMessage UploadStudents()
        {
            HttpResponseMessage result = null;
            var response = "";
            int returnedVal = 0;
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 0)
            {
                var docfiles = new List<string>();
                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];

                    var filePath = HttpContext.Current.Server.MapPath("~/Files/" + postedFile.FileName);
                    fileName = postedFile.FileName;
                    postedFile.SaveAs(filePath);
                    docfiles.Add(filePath);
                    returnedVal = _fileManegement.UploadExcel(postedFile);
                    File.Delete(filePath);
                }
                if (returnedVal == 200)
                    response = "File uploded successfully...";
                else
                    response = "Upload stopped with file " + fileName + "and sheet name " + returnedVal;
                result = Request.CreateResponse(HttpStatusCode.Created, response);
            }
            else
            {
                result = Request.CreateResponse(HttpStatusCode.BadRequest);
            }
            return result;
        }
    }
}
