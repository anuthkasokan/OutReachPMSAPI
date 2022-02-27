using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;

namespace BusinessLayer.Mapper
{
    public class RoleMapper : IMapper<role,Role>, IMapper<User, user>
    {
        public RoleMapper()
        {

        }

        public Role Map(role roleIn)
        {
            Role role = new Role();
            role.RoleName = roleIn.rolename;
            role.RoleID = roleIn.roleid;
            return role;
        }

        public user Map(User userIn)
        {
            user user = new user();
            user.userid = userIn.userid;
            user.username = userIn.username;
            user.roleid = userIn.roleid;
            user.schoolid = userIn.schoolid;
            user.cityid = userIn.cityid;
            return user;
        }
    }
}
