using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.DataAccess
{
    public class UserData : IGetDatas<user>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();
        public UserData()
        { }

        public List<user> GetData()
        {
            return pmsDb.users.ToList();
        }
    }
}
