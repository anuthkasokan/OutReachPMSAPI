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
    class AuthenticationMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_UserFromDataAccess_ReturnUserFordetails()
        {
            //Arrange
            user user = new user
            {
                userid = 1,
                username = "Kanthi",
                role = new role
                {
                    roleid = 1,
                    rolename = "admin"
                },
                schoolid = 1,
                cityid = 1
            };
            var expected = new User
            {
                userid = 1,
                username = "Kanthi",
                role="admin",
                schoolid = 1,
                cityid = 1
            };


            //Act
            var target = new AuthenticationMapper();
            var actual = target.Map(user);

            //Assert
            Assert.IsInstanceOf<User>(actual);
            Assert.AreEqual(expected.userid, actual.userid);
        }
    }
}
