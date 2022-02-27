
using System.Collections.Generic;

namespace BusinessLayer.Interface
{
    public interface IGetDetailsBy2Id<TModel>
    {
        List<TModel> GetDetails(int id,int id1);
    }
}
