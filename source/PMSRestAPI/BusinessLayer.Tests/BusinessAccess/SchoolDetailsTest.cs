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
    class SchoolDetailsTest
    {
        private Mock<ISchoolData<school>> _schoolData;
        private Mock<IMapper<school, School>> _schoolMapper;
        private Mock<IGetDatasById<parameterschoolmap>> _paramData;
        private Mock<IMapper<List<parameterschoolmap>, Parameter>> _alterParameter;

        [SetUp]
        public void SetUp()
        {
            _schoolData = new Mock<ISchoolData<school>>();
            _schoolMapper = new Mock<IMapper<school, School>>();
            _paramData = new Mock<IGetDatasById<parameterschoolmap>>();
            _alterParameter = new Mock<IMapper<List<parameterschoolmap>, Parameter>>();
        }

        [Test]
        public void GetSchoolListById_WithCityId_ReturnSchoolList()
        {
            //Arrange

            List<school> schoolList = new List<school>
            {
                new school
                {
                schoolid=1,
                schoolname="Govt High School, Thrikkakara"
                }
            };
            school schoolDetails = new school
            {
                schoolid = 1,
                schoolname = "Govt High School, Thrikkakara"
            };

            School mappedSchool = new School
            {
                schoolid = 1,
                schoolname = "Govt High School, Thrikkakara"
            };

            var expected = new List<School>
            {
                  new School
                {
                schoolid = 1,
                schoolname = "Govt High School, Thrikkakara"
                }
            };

            _schoolData.Setup(data => data.GetData()).Returns(schoolList);
            _schoolMapper.Setup(map => map.Map(It.IsAny<school>())).Returns(mappedSchool);

            //Act
            var target = new SchoolDetails(_schoolData.Object, _schoolMapper.Object, _paramData.Object,_alterParameter.Object);
            var actual = target.GetSchoolList();

            //Assert
            Assert.IsInstanceOf<List<School>>(actual);
            Assert.AreEqual(expected[0].schoolid, actual[0].schoolid);
        }
    }
}
