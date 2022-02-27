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
    class ChartMapperTest
    {


        [SetUp]
        public void SetUp()
        {
        }

        [Test]
        public void Map_PerformanceFromDataAccess_ReturnsPointsForDetails()
        {
            //Arrange
            List<studentdailyperformance> performances = new List<studentdailyperformance>
            {
              new studentdailyperformance
              {
                  Attendance=1,
                  HomeWork=1,
                  Discipline=1
              }
            };
            var expected = 20;

            //Act
            var target = new ChartMapper();
            var actual = target.Map(performances);

            //Assert
            Assert.AreEqual(expected, actual);
        }
    }
}
