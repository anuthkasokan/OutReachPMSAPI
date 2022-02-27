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
    class SchoolWisePerformanceMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_SchoolWisePerformFromDataAccess_ReturnSchoolWisePerformForDetails()
        {
            //Arrange
            List<studentdailyperformance> performances = new List<studentdailyperformance>
            {
                new studentdailyperformance {Attendance=1,HomeWork=1,Discipline=1}
            };
            school schoolDetail = new school();
            schoolDetail.schoolid = 1;
            schoolDetail.schoolname = "Thrikkakara Govt High School";

            var expected = new SchoolWisePerformance();
            expected.SchoolId = 1;
            expected.SchoolName = "Thrikkara Govt High School";
            expected.Attendance = 5;
            expected.Homework = 5;
            expected.Discipline = 5;
            expected.Points = 20;


            //Act
            var target = new SchoolWisePerformanceMapper();
            var actual = target.Map(schoolDetail, performances);

            //Assert
            Assert.IsInstanceOf<SchoolWisePerformance>(actual);
            Assert.AreEqual(expected.SchoolId, actual.SchoolId);
        }
    }
}
