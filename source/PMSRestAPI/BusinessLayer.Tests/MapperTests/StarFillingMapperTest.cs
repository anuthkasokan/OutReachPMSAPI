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
    class StarFillingMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_StarDetailsFromDataAccess_ReturnStarDetailsForDetails()
        {
            //Arrange
            List<studentdailyperformance> dailyPerformances = new List<studentdailyperformance>
            {
                new studentdailyperformance {day = 1,Attendance = 1, Discipline=1,HomeWork=1},
                new studentdailyperformance {day = 2,Attendance = 1, Discipline=1,HomeWork=1},
                new studentdailyperformance {day = 3,Attendance = 1, Discipline=1,HomeWork=1},
            };
  

            //Act
            var target = new StarFillingMapper();
            var actual = target.Map(dailyPerformances);

            //Assert
            Assert.IsInstanceOf<StarWisePerformance>(actual);
        }
    }
}
