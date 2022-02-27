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
    class ClassWisePerformanceMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_PerformanceFromDataAccess_ReturnClassWiseForDetails()
        {
            //Arrange
            List<studentdailyperformance> performances = new List<studentdailyperformance>
            {
                new studentdailyperformance {Attendance=1,HomeWork=1,Discipline=1}
            };
            @class classDetail = new @class();
            classDetail.classid = 1;
            classDetail.classname = "1st A";

            var expected = new ClassWisePerformance();
            expected.ClassId = 1;
            expected.ClassName = "1st A";
            expected.Attendance = 5;
            expected.Homework = 5;
            expected.Discipline = 5;
            expected.Points = 20;
            expected.Total = 0;


            //Act
            var target = new ClassWisePerformanceMapper();
            var actual = target.Map(classDetail,performances);

            //Assert
            Assert.IsInstanceOf<ClassWisePerformance>(actual);
            Assert.AreEqual(expected.ClassId, actual.ClassId);
        }
    }
}
