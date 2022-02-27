using BusinessLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface IPerformanceManagement
    {
        UploadPrimaryDetails GetPrimaryDetails(string school,string classname,string month,string year);
    }
}
