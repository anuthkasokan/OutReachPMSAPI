using System.Configuration;
using System.Net;
using System.Net.Http;

namespace BusinessLayer.Common
{
    public static class Response
    {        
        public static HttpResponseMessage AddHeader(HttpResponseMessage response)
        {
            string appUrl = ConfigurationManager.AppSettings.Get("ApplicationUrl");
            response.Headers.Add("Access-Control-Allow-Origin", appUrl);
            response.Headers.Add("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,PATCH,DELETE");
            response.Headers.Add("Access-Control-Allow-Headers", "X-Requested,With,content-type");
            return response;
        }
    }
}
