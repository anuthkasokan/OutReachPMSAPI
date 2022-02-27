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
    class StudentDetailsTest
    {
        private Mock<IStudentData<student>> _studentData;
        private Mock<IMapper<student, Student>> _studentMapper;

        [SetUp]
        public void SetUp()
        {
            _studentData = new Mock<IStudentData<student>>();
            _studentMapper = new Mock<IMapper<student, Student>>();
        }
        //[Test]
        //public void CheckCredetials_WithEmailIdAndPassword_ReturnUserDetails()
        //{
        //    //Arrange
        //    string emailId = "kanthi@gmail.com";
        //    string password = "abc1234";

        //    user userDetails = new user
        //    {
        //        userid = 1,
        //        username = "Kanthi",
        //        roleid = 1
        //    };

        //    User mappedUserDetails = new User
        //    {
        //        userid = 1,
        //        username = "Kanthi",
        //        roleid = 1
        //    };

        //    _authenticationData.Setup(data => data.CheckCredential(emailId, password)).Returns(userDetails);
        //    _authenticationMapper.Setup(map => map.Map(userDetails)).Returns(mappedUserDetails);

        //    //Act
        //    var target = new AuthenticationDetails(_authenticationData.Object, _authenticationMapper.Object);
        //    var actual = target.CheckCredentials(emailId, password);

        //    //Assert
        //    Assert.IsInstanceOf<user>(actual);
        //    Assert.AreEqual(userDetails.username, actual.username);
        //}
    }
}
