using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BusinessLayer.Interface
{
    public interface IFileManagement
    {
        int UploadExcel(HttpPostedFile file);
    }
}
