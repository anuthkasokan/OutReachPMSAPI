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
    public class ClassDetailsTest
    {
        private Mock<IGetDatas<@class>> _mockClassData;
        private Mock<IMapper<@class, Class>> _mockClassMapper;

        [SetUp]
        public void SetUp()
        {
            _mockClassData = new Mock<IGetDatas<@class>>();
            _mockClassMapper = new Mock<IMapper<@class, Class>>();
        }

        [Test]
        public void GetDetails__ReturnCityList()
        {
            //Arrange

            List<@class> classList = new List<@class>
            {
                new @class
                {
                classid=1,
                classname="1st A"
                }
            };
            @class classDetails = new @class
            {
                classid=1,
                classname="1st A"
            };

            Class mappedClass = new Class
            {
                classid = 1,
                classname = "1st A"
            };

            _mockClassData.Setup(data => data.GetData()).Returns(classList);
            _mockClassMapper.Setup(map => map.Map(It.IsAny<@class>())).Returns(mappedClass);

            //Act
            var target = new ClassDetails(_mockClassData.Object, _mockClassMapper.Object);
            var actual = target.GetDetails();

            //Assert
            Assert.IsInstanceOf<List<Class>>(actual);
            Assert.AreEqual(mappedClass.classid, actual[0].classid);
        }
    }
}
