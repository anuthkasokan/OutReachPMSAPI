using BusinessLayer.BusinessAccess;
using BusinessLayer.Interface;
using BusinessLayer.Mapper;
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
    class AlterParameterMapperTest
    {
      

        [SetUp]
        public void SetUp()
        {
        
        }

        [Test]
        public void Map_ParameterFromDataAccess_ReturnParameterForDetails()
        {
            //Arrange
            List<parameterschoolmap> parameters = new List<parameterschoolmap>
            {
                new parameterschoolmap {parameterid = 1,alterparameter = "Attendance"},
                new parameterschoolmap {parameterid = 2,alterparameter = "Homework"},
                new parameterschoolmap {parameterid = 3,alterparameter = "Discipline"}
            };
            var expected= new Parameter
            {
                Attendance="Attendance",
                Homework="Homework",
                Discipline="Discipline"
            };
          

            //Act
            var target = new AlterParameterMapper();
            var actual = target.Map(parameters);

            //Assert
            Assert.IsInstanceOf<Parameter>(actual);
            Assert.AreEqual(expected.Attendance, actual.Attendance);
        }
    }
}
