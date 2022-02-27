using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface IStarDetails<TModel>
    {
        TModel GetDetailsForCity(int cityid);
        TModel GetDetails(int id);
        TModel GetDetails(int id1, int id2);
        TModel GetDetailsForStudent(int id);
        TModel GetDetailsForGroup(int id);
        TModel GetGroupDetailsForClass(int groupid, int classid);

    }
}
