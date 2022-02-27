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
    class UserMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_UserFromDataAccess_ReturnUserForDetails()
        {
            user userDetail = new user();
            userDetail.userid = 1;
            userDetail.username = "Kanthi";

            var expected = new User();
            expected.userid = 1;
            expected.username = "Kanthi";

            //Act
            var target = new UserMapper();
            var actual = target.Map(userDetail);

            //Assert
            Assert.IsInstanceOf<User>(actual);
            Assert.AreEqual(expected.userid, actual.userid);
        }
    }
}
