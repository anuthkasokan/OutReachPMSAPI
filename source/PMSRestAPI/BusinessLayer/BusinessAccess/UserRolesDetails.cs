using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using System.Collections.Generic;

namespace BusinessLayer.BusinessAccess
{
    public class UserRolesDetails : IUserRole<Role>
    {
        private IUserRoleData<role> _userRolesData;
        private IMapper<role, Role> _roleMapper;
        private IMapper<User, user> _mapperForUpdate;

        public UserRolesDetails()
        {
            _userRolesData = new UserRolesData();
            _roleMapper = new RoleMapper();
            _mapperForUpdate = new RoleMapper();
        }

        public UserRolesDetails(IUserRoleData<role> userRolesData, IMapper<role, Role> roleMapper)
        {
            _userRolesData = userRolesData;
            _roleMapper = roleMapper;
        }

        public List<Role> GetDetails()
        {
            List<Role> roles = new List<Role>();
            var roleDetails = _userRolesData.GetData();
            foreach (var role in roleDetails)
            {
                roles.Add(_roleMapper.Map(role));
            }
            return roles;
        }

        public List<Role> GetDetails(int id)
        {
            List<Role> roles = new List<Role>();
            var roleDetails = _userRolesData.GetData(id);
            foreach (var role in roleDetails)
            {
                roles.Add(_roleMapper.Map(role));
            }
            return roles;
        }

        public int SaveRole(User user)
        {
            var mappedDetail = _mapperForUpdate.Map(user);
            return _userRolesData.Execute(mappedDetail);
        }
    }
}
