using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Model
{
    public class StudentWisePerformance
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string RollNumber { get; set; }
        public string Date { get; set; }
        public int Attendance { get; set; }
        public int Discipline { get; set; }
        public int Homework { get; set; }
        public int Total { get; set; }
        public int Points { get; set; }
        public int StudentSchoolMapId { get; set; }
    }
}
