using BusinessLayer.BusinessAccess;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Principal;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace PMSRestAPI.Models
{
    public class Authorization
    {
        private IAuthenticationDetails _authenticationDetails;

        public Authorization()
        {
            _authenticationDetails = new AuthenticationDetails();
        }

        public User CheckCredential(string username, string password)
        {
            var user = _authenticationDetails.CheckCredentials(username, password);            
            return user;
        }

        public class AuthenticationHandler : DelegatingHandler
        {
            protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
            {
                try
                {
                    var tokens = request.Headers.GetValues("Authorization").FirstOrDefault();
                    tokens = tokens.Replace("Basic", "").Trim();
                    if (tokens != null)
                    {
                        byte[] data = Convert.FromBase64String(tokens);
                        string decodedString = Encoding.UTF8.GetString(data);
                        string[] tokensValues = decodedString.Split(':');

                        User ObjUser = new Authorization().CheckCredential(tokensValues[0], tokensValues[1]);
                        if (ObjUser != null)
                        {
                            IPrincipal principal = new GenericPrincipal(new GenericIdentity(ObjUser.username), ObjUser.role.Split(','));
                            Thread.CurrentPrincipal = principal;
                            HttpContext.Current.User = principal;
                        }
                        else
                        {
                            //The user is unauthorize and return 401 status  
                            var response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
                            var tsc = new TaskCompletionSource<HttpResponseMessage>();
                            tsc.SetResult(response);
                            return tsc.Task;
                        }
                    }
                    else
                    {
                        //Bad Request request because Authentication header is set but value is null  
                        var response = new HttpResponseMessage(HttpStatusCode.Forbidden);
                        var tsc = new TaskCompletionSource<HttpResponseMessage>();
                        tsc.SetResult(response);
                        return tsc.Task;
                    }
                    return base.SendAsync(request, cancellationToken);
                }
                catch
                {
                    //User did not set Authentication header  
                    var response = new HttpResponseMessage(HttpStatusCode.Forbidden);
                    var tsc = new TaskCompletionSource<HttpResponseMessage>();
                    tsc.SetResult(response);
                    return tsc.Task;
                }
            }

        }

    }
}