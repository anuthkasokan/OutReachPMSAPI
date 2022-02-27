using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;

namespace DataAccessLayer.DataAccess
{
    public class ParameterData:IGetDatasById<parameterschoolmap>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();

        public List<parameterschoolmap> GetData(int schoolid)
        {
            var alterParamter = from  ps in pmsDb.parameterschoolmaps
                                where ps.schoolid == schoolid
                                select ps;

            return alterParamter.ToList();
        }
    }
}
