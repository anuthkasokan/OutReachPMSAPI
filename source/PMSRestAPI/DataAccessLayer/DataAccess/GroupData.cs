using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;

namespace DataAccessLayer.DataAccess
{
    public class GroupData:IGetDatasById<group>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();
        public List<group> GetData(int schoolId)
        {
            var studentDetails = from st in pmsDb.groups
                                 where st.schoolid == schoolId
                                 select st;
            return studentDetails.ToList();

        }

    }
}
