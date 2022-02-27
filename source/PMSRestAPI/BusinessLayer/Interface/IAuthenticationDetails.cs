

using BusinessLayer.Model;

namespace BusinessLayer.Interface
{
    public interface IAuthenticationDetails
    {
        User CheckCredentials(string emailid, string password);
    }
}
