using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IUserRoleData<TModel>
    {
        List<TModel> GetData();
        List<TModel> GetData(int id);

        int Execute(user userDetail);
    }
}
