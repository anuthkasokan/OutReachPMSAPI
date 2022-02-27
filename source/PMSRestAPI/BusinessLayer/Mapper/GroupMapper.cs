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
    public class GroupMapper : IMapper<group, Group>
    {
        public Group Map(group groupIn)
        {
            Group group = new Group();
            group.groupid = groupIn.groupid;
            group.groupname = groupIn.groupname;
            return group;
        }
    }
}
