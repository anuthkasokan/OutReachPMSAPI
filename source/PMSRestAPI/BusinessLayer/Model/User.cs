using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Model
{
    public class User
    {
        public int userid { get; set; }
        public string username { get; set; }
        public int schoolid { get; set; }
        public int roleid { get; set; }
        public int cityid { get; set; }
        public string role { get; set; }
    }
}
