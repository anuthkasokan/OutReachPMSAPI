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
    public class CityDetailsTest
    {
        private Mock<IGetDatas<city>> _mockCityData;
        private Mock<IMapper<city, City>> _mockCityMapper;

        [SetUp]
        public void SetUp()
        {
            _mockCityData = new Mock<IGetDatas<city>>();
            _mockCityMapper = new Mock<IMapper<city, City>>();
        }

        [Test]
        public void GetDetails__ReturnCityList()
        {
            //Arrange

            List<city> cityList = new List<city>
            {
                    new city
                    {
                        cityid=1,
                        cityname="Kochi"
                    }
            };
            city city = new city
            {
                cityid = 1,
                cityname = "Kochi"
            };

            City mappedCity = new City
            {
              cityid=1,
              cityname="Kochi"
            };

            _mockCityData.Setup(data => data.GetData()).Returns(cityList);
            _mockCityMapper.Setup(map => map.Map(It.IsAny<city>())).Returns(mappedCity);

            //Act
            var target = new CityDetails(_mockCityData.Object, _mockCityMapper.Object);
            var actual = target.GetDetails();

            //Assert
            Assert.IsInstanceOf<List<City>>(actual);
            Assert.AreEqual(mappedCity.cityid, actual[0].cityid);
        }
    }
}
