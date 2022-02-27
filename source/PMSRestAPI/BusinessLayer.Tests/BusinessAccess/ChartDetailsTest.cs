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
    public class ChartDetailsTest
    {
        private Mock<IChartData> _mockChartData;
        private Mock<IMapper<List<studentdailyperformance>, int>> _mockChartMapper;

        [SetUp]
        public void SetUp()
        {
            _mockChartData = new Mock<IChartData>();
            _mockChartMapper = new Mock<IMapper<List<studentdailyperformance>, int>>();
        }

        [Test]
        public void GetPointsForCityChart_WithCityId_ReturnsPointsList()
        {
            //Arrange
            int cityId=1;

            List<string> months = new List<string>
           {
               "01/2019",
               "02/2019"
           };

            List<studentdailyperformance> studentdailyperformances = new List<studentdailyperformance>();

            _mockChartData.Setup(data => data.GetCityDataForChart(It.IsAny<int>(),It.IsAny<int>())).Returns(studentdailyperformances);
            _mockChartData.Setup(data => data.GetMonths()).Returns(months);
            _mockChartMapper.Setup(map => map.Map(studentdailyperformances)).Returns(100);

            //Act
            var target = new ChartDetails(_mockChartData.Object, _mockChartMapper.Object);
            var actual = target.GetPointsForCityChart(cityId);

            //Assert
            Assert.IsInstanceOf<List<int>>(actual);
            Assert.AreEqual(actual[0], 100);
        }
    }
}
