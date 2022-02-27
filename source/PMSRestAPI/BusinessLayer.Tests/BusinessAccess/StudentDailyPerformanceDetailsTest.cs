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
    class StudentDailyPerformanceDetailsTest
    {
        private Mock<ISchoolData<school>> _schoolData;
        private Mock<IGetDatas<@class>> _classData;
        private Mock<IStudentData<student>> _studentData;
        private Mock<IPerformanceData<studentdailyperformance>> _studentDailyPerformance;
        private Mock<IGetDatasById<group>> _groupDataForSchool;
        private Mock<IMapper2<school, List<studentdailyperformance>, SchoolWisePerformance>> _schoolPerformanceMapper;
        private Mock<IMapper2<@class, List<studentdailyperformance>, ClassWisePerformance>> _classPerformanceMapper;
        private Mock<IMapper2<student, List<studentdailyperformance>, StudentWisePerformance>> _studentPerformanceMapper;
        private Mock<IMapper<studentdailyperformance, StudentWisePerformance>> _individualPerformanceMapper;
        private Mock<IMapper2<student, studentdailyperformance, StudentWisePerformance>> _studentPerformanceByDateMapper;
        private Mock<IMapper2<group, List<studentdailyperformance>, GroupWisePerformance>> _groupPerformanceMapper;
        private Mock<IMapper<AddPerformanceData, List<parameterschoolmap>>> _alterParamMapper;
        private Mock<IMapper2<StudentWisePerformance, string, studentdailyperformance>> _editMapper;
        private Mock<IMapper<studentschoolmap, StudentSchoolMap>> _studentSchoolmapMapper;

        [SetUp]
        public void SetUp()
        {
          _schoolData = new Mock<ISchoolData<school>>();
          _classData = new Mock<IGetDatas<@class>>();
          _studentData = new Mock<IStudentData<student>>();
          _studentDailyPerformance = new Mock<IPerformanceData<studentdailyperformance>>();
          _groupDataForSchool = new Mock<IGetDatasById<group>>();
          _schoolPerformanceMapper = new Mock<IMapper2<school, List<studentdailyperformance>, SchoolWisePerformance>>();
          _classPerformanceMapper = new Mock<IMapper2<@class, List<studentdailyperformance>, ClassWisePerformance>>();
          _studentPerformanceMapper = new Mock<IMapper2<student, List<studentdailyperformance>, StudentWisePerformance>>();
          _individualPerformanceMapper = new Mock<IMapper<studentdailyperformance, StudentWisePerformance>>();
          _studentPerformanceByDateMapper = new Mock<IMapper2<student, studentdailyperformance, StudentWisePerformance>>();
          _groupPerformanceMapper = new Mock<IMapper2<group, List<studentdailyperformance>, GroupWisePerformance>>();
          _alterParamMapper = new Mock<IMapper<AddPerformanceData, List<parameterschoolmap>>>();
          _editMapper = new Mock<IMapper2<StudentWisePerformance, string, studentdailyperformance>>();
          _studentSchoolmapMapper = new Mock<IMapper<studentschoolmap, StudentSchoolMap>>();
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
