using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Model
{
    public class SchoolWisePerformance
    {
        public int SchoolId { get; set; }
        public string SchoolName { get; set; }
        public int Attendance { get; set; }
        public int Discipline { get; set; }
        public int Homework { get; set; }
        public int Points { get; set; }

    }
}
