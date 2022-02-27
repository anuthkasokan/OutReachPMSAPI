using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Model
{
    public class School
    {
        public int schoolid { get; set; }
        public string schoolname { get; set; }

        public int attendance { get; set; }
        public int discipline { get; set; }
        public int homework { get; set; }
        public int total { get; set; }
    }
}
