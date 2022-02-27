using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.DataAccess
{
    public class SchoolData : ISchoolData<school>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();

        public SchoolData()
        {

        }

        public List<school> GetDataByCityID(int cityId)
        {
            return pmsDb.schools.Where(id => id.cityid == cityId).ToList();
        }


        public List<school> GetData()
        {
            return pmsDb.schools.ToList();
        }

        public school GetDataBySchoolID(int schoolid)
        {
            return pmsDb.schools.Where(id => id.schoolid == schoolid).FirstOrDefault();
        }
    }
}
