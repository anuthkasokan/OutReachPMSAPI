using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.DataAccess
{
    public class ClassData : IGetDatas<@class>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();

        public List<@class> GetData()
        {
            return pmsDb.classes.ToList();
        }
    }
}
