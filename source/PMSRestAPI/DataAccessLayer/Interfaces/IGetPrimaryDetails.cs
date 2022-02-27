using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IGetPrimaryDetails
    {
        GetDataForExcelUpload_Result GetPrimaryDetails(string schoolName, string Class, string Month, string year);
    }
}
