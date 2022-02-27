using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.DataAccess
{
    public class CityData : IGetDatas<city>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();
        public CityData()
        {
        }

        public List<city> GetData()
        {
            return pmsDb.cities.Where(c =>c.status == true).ToList();
        }
    }
}
