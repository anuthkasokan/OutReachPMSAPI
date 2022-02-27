using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IGetDataBy2Id<TModel>
    {
        List<TModel> GetData(int id,int id1);
    }
}
