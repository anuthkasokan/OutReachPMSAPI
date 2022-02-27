using DataAccessLayer.Interfaces;
using System.Linq;

namespace DataAccessLayer.DataAccess
{
    public class AuthenticationData : IAuthenticationData
    {
        outreachpmsEntities db = new outreachpmsEntities();
        public user CheckCredential(string emailid,string password)
        {
            return db.users.Where(user => user.email == emailid && user.password == password).Select(a => a).FirstOrDefault();
        }
    }
}
