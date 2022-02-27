using System.Collections.Generic;
using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;

namespace BusinessLayer.BusinessAccess
{
    public class GroupDetails : IGetDetailsById<Group>
    {
        private IGetDatasById<group> _groupData;
        private IMapper<group,Group> _groupMapper;

        public GroupDetails()
        {
            _groupData = new GroupData();
            _groupMapper = new GroupMapper();
        }

        public GroupDetails(IGetDatasById<group> groupData, IMapper<group, Group> groupMapper)
        {
            _groupData = groupData;
            _groupMapper = groupMapper;
        }

        public List<Group> GetDetails(int schoolid)
        {
            List<Group> groupList = new List<Group>();
            var groupDetails = _groupData.GetData(schoolid);
            foreach(var group in groupDetails)
            {
                groupList.Add(_groupMapper.Map(group));
            }
            return groupList;
        }
    }
}
