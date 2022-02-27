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
    class GroupWisePerformanceMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_GroupWisePerformanceFromDataAccess_ReturnGroupWisePerformanceForDetails()
        {
            //Arrange
            List<studentdailyperformance> performances = new List<studentdailyperformance>
            {
                new studentdailyperformance {Attendance=1,HomeWork=1,Discipline=1}
            };
            group groupDetail = new group();
            groupDetail.groupid = 1;
            groupDetail.groupname = "Strawberry";

            var expected = new GroupWisePerformance();
            expected.GroupId = 1;
            expected.GroupName = "Strawberry";
            expected.Attendance = 5;
            expected.Homework = 5;
            expected.Discipline = 5;
            expected.Points = 20;


            //Act
            var target = new GroupWisePerformanceMapper();
            var actual = target.Map(groupDetail, performances);

            //Assert
            Assert.IsInstanceOf<GroupWisePerformance>(actual);
            Assert.AreEqual(expected.GroupId, actual.GroupId);
        }
    }
}
