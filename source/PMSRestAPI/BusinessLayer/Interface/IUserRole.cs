using BusinessLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface IUserRole<TModel>
    {
        List<TModel> GetDetails();
        List<TModel> GetDetails(int id);

        int SaveRole(User user);
    }
}
