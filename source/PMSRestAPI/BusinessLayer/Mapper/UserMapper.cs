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
    public class UserMapper : IMapper<user, User>
    {
        public User Map(user userIn)
        {
            User user = new User();
            user.userid = userIn.userid;
            user.username = userIn.username;
            user.roleid = userIn.roleid != null ? Convert.ToInt32(userIn.roleid) : 0;
            user.schoolid = userIn.schoolid != null? Convert.ToInt32(userIn.schoolid):0;
            user.cityid = userIn.cityid != null ? Convert.ToInt32(userIn.cityid) : 0;
            return user;
        }

    }
}
