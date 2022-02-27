using BusinessLayer.BusinessAccess;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using BusinessLayer.Mapper;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using Moq;
using NUnit.Framework;
using System.Collections.Generic;

namespace BusinessLayer.Tests.BusinessAccess
{
    [TestFixture]
    class RoleMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_RoleFromDataAccess_ReturnParameterROleForDetails()
        {
            role roleDetail = new role();
            roleDetail.roleid = 1;
            roleDetail.rolename = "1st A";

            var expected = new Role();
            expected.RoleID = 1;
            expected.RoleName = "1st A";

            //Act
            var target = new RoleMapper();
            var actual = target.Map(roleDetail);

            //Assert
            Assert.IsInstanceOf<Role>(actual);
            Assert.AreEqual(expected.RoleID, actual.RoleID);
        }
    }
}
