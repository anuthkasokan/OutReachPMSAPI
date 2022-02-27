using BusinessLayer.BusinessAccess;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using Moq;
using NUnit.Framework;
using System.Collections.Generic;

namespace BusinessLayer.Tests.BusinessAccess
{
    [TestFixture]
    class UserRolesDetailsTest
    {
        private Mock<IUserRoleData<role>> _userRolesData;
        private Mock<IMapper<role, Role>> _roleMapper;

        [SetUp]
        public void SetUp()
        {
            _userRolesData = new Mock<IUserRoleData<role>>();
            _roleMapper = new Mock<IMapper<role, Role>>();
        }

        [Test]
        public void GetDetails_ValidRoleDataFromDataAccess_ReturnRoleDetails()
        {
            //Arrange
            List<role> roles = new List<role>
            {
                new role {rolename = "Admin",roleid = 1},
                new role {rolename = "PMO",roleid = 2},
                new role {rolename = "POC",roleid = 3}
            };
            Role role = new Role();
            role.RoleName = "Admin";
            _userRolesData.Setup(data => data.GetData()).Returns(roles);
            _roleMapper.Setup(map => map.Map(roles[0])).Returns(role);

            //Act
            var target = new UserRolesDetails(_userRolesData.Object, _roleMapper.Object);
            var actual = target.GetDetails();

            //Assert
            Assert.IsInstanceOf<List<Role>>(actual);
            Assert.AreEqual(roles[0].rolename, actual[0].RoleName);
        }
    }
}
