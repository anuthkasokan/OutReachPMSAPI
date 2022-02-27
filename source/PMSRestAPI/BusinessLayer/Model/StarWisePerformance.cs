using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Model
{
    public class StarWisePerformance
    { 
        public int Attendance { get; set; }
        public int Discipline { get; set; }
        public int Homework { get; set; }

        public int MonthlyTotal { get; set; }
        public List<string> StarAttendance { get; set; }
        public List<string> StarDiscipline { get; set; }
        public List<string> StarHomework { get; set; }
        public List<int> Days { get; set; }

    }
}
