using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Mapper
{
    public class ClassMapper : IMapper<@class, Class>
    {
        public Class Map(@class classIn)
        {
            Class classes = new Class();
            classes.classid = classIn.classid;
            classes.classname = classIn.classname;
            return classes;
        }
    }
}
