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
    class CityMapperTest
    {

        [SetUp]
        public void SetUp()
        {
          
        }

        [Test]
        public void Map_cityDetailsFromDataAccess_ReturnCityDetails()
        {
            //Arrange
            city cityDetail = new city();
            cityDetail.cityid = 1;
            cityDetail.cityname = "Kochi";

            var expected = new City();
            expected.cityid = 1;
            expected.cityname = "Kochi";

            //Act
            var target = new CityMapper();
            var actual = target.Map(cityDetail);

            //Assert
            Assert.IsInstanceOf<City>(actual);
            Assert.AreEqual(expected.cityid, actual.cityid);
        }
    }
}
