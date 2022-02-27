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
    class StarDetailsTest
    {
        //private Mock<IPerformanceData<studentdailyperformance>> _studentPerformanceData;
        //private Mock<IMapper<List<studentdailyperformance>, StarWisePerformance>> _starMapper;

        //[SetUp]
        //public void SetUp()
        //{
        //    _studentPerformanceData = new Mock<IPerformanceData<studentdailyperformance>>();
        //    _starMapper = new Mock<IMapper<List<studentdailyperformance>, StarWisePerformance>>();
        //}

        //[Test]
        //public void GetDetailsForCity_WithCityId_ReturnStarDetailsForCity()
        //{
        //    //Arrange
        //    int cityId = 1;


        //    StarWisePerformance starWisePerformance = new StarWisePerformance();

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
