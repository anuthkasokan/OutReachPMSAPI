using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Model
{
    [Serializable]
    public class AddPerformanceData
    {
        public string Attendance { get; set; }
        public int ClassId { get; set; }
        public string Discipline { get; set; }
        public string EntryDate { get; set; }
        public string Homework { get; set; }
        public int SchoolId { get; set; }
        public List<StudentWisePerformance> StudentList { get; set; }


    }
}
