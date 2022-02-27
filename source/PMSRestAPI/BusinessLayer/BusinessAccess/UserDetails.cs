using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;

namespace BusinessLayer.BusinessAccess
{
    public class UserDetails : IGetDetails<User>
    {
        private IGetDatas<user> _userData;
        private IMapper<user, User> _userMapper;

        public UserDetails()
        {
            _userData = new UserData();
            _userMapper = new UserMapper();
        }

        public List<User> GetDetails()
        {
            List<User> users = new List<User>();
            var userDetails = _userData.GetData();
            foreach(var user in userDetails)
            {
                users.Add(_userMapper.Map(user));
            }
            return users;
        }
    }
}
