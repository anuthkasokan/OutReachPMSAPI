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
    public class SchoolMapper : IMapper<school, School>
    {
        public School Map(school schoolIn)
        {
            School school = new School();
            school.schoolid = schoolIn.schoolid;
            school.schoolname = schoolIn.schoolname;
            return school;
        }
    }
}
