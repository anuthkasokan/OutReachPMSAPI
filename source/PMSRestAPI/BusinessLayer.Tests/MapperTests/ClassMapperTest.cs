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
    class ClassMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_classDetailsFromDataAccess_ReturnClassDetailForDetails()
        {
            //Arrange
            @class classDetail = new @class();
            classDetail.classid = 1;
            classDetail.classname = "1st A";

            var expected = new Class();
            expected.classid = 1;
            expected.classname = "1st A";

            //Act
            var target = new ClassMapper();
            var actual = target.Map(classDetail);

            //Assert
            Assert.IsInstanceOf<Class>(actual);
            Assert.AreEqual(expected.classid, actual.classid);
        }
    }
}
