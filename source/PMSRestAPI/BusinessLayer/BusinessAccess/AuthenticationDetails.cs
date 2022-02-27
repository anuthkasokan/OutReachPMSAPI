using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.BusinessAccess
{
    public class AuthenticationDetails : IAuthenticationDetails
    {
        private readonly IAuthenticationData _authenticationData;
        private readonly IMapper<user,User> _authenticationMapper;

        public AuthenticationDetails()
        {
            _authenticationData = new AuthenticationData();
            _authenticationMapper = new AuthenticationMapper();
        }

        public AuthenticationDetails(IAuthenticationData authenticationData, IMapper<user, User> authenticationMapper)
        {
            _authenticationData = authenticationData;
            _authenticationMapper = authenticationMapper;
        }


        public User CheckCredentials(string emailid, string password)
        {
            return _authenticationMapper.Map(_authenticationData.CheckCredential(emailid, password));
        }
    }
}
