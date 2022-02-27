using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.DataAccess
{    
    public class UserRolesData : IUserRoleData<role>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();
        public UserRolesData()
        {

        }

        public List<role> GetData()
        {
            return pmsDb.roles.ToList();
        }

        public List<role> GetData(int id)
        {
            var rolesbyuserid = from u in pmsDb.users
                                join r in pmsDb.roles on u.roleid equals r.roleid
                                where u.userid == id
                                select r;
            return rolesbyuserid.ToList();
        }

        public int Execute(user userdetail)
        {
            user userRow = pmsDb.users.Where(u =>u.userid == userdetail.userid).FirstOrDefault();
            if(userRow != null)
            {
                userRow.roleid = userdetail.roleid;
                if(userdetail.roleid == 3)
                {
                    userRow.schoolid = userdetail.schoolid;
                    userRow.cityid = userdetail.cityid;
                }
                else
                {
                    userRow.schoolid = null;
                    userRow.cityid = null;
                }

                pmsDb.Entry(userRow).State = System.Data.Entity.EntityState.Modified;
                pmsDb.SaveChanges();
            }
            else
            {
                return 0;
            }
          
            return 1;
        }
    }
}
