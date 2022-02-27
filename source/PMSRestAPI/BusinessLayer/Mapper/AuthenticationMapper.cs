using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Mapper
{
    public class AuthenticationMapper : IMapper<user, User>
    {
        public User Map(user userIn)
        {
            var user = new User();
            user.userid = userIn.userid;
            user.username = userIn.username;
            user.role = userIn.role.rolename;
            user.schoolid = userIn.schoolid==null?0: Convert.ToInt32(userIn.schoolid);
            user.cityid = userIn.cityid == null ? 0 : Convert.ToInt32(userIn.cityid);
            return user;
        }
    }
}
