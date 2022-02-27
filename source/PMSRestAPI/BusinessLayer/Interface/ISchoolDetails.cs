using BusinessLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface ISchoolDetails<TModel>
    {
        List<TModel> GetSchoolListById(int cityId);

        List<TModel> GetSchoolList();

        Parameter GetAlterParameters(int schoolid);
    }
}
