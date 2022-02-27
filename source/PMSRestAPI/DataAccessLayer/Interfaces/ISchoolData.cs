using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface ISchoolData<TModel>
    {
        List<TModel> GetData();

        List<TModel> GetDataByCityID(int cityid);

        TModel GetDataBySchoolID(int schoolid);
    }
}
