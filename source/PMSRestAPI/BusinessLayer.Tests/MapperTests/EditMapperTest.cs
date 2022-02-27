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
using System;

namespace BusinessLayer.Tests.BusinessAccess
{
    [TestFixture]
    class EditMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_EditDetailsFromUI_ReturnPerformanceDetails()
        {
            //Arrange
            AddPerformanceData data =  new AddPerformanceData
              {
                  SchoolId=1,
                  Attendance="Attendance",
                  Homework="Homework",
                  Discipline="Discipline"
              
              };
            var expected = new List<parameterschoolmap>();

            parameterschoolmap parameter = new parameterschoolmap();
            parameter.schoolid = 1;
            parameter.parameterid = 1;
            parameter.alterparameter = "Attendance";
            parameter.status = true;
            parameter.created_on = DateTime.Now;
            expected.Add(parameter);

            parameter = new parameterschoolmap();
            parameter.schoolid = 1;
            parameter.parameterid = 2;
            parameter.alterparameter = "Discipline";
            parameter.status = true;
            parameter.created_on = DateTime.Now;
            expected.Add(parameter);

            parameter = new parameterschoolmap();
            parameter.schoolid = 1;
            parameter.parameterid = 3;
            parameter.alterparameter = "Homework";
            parameter.status = true;
            parameter.created_on = DateTime.Now;
            expected.Add(parameter);


            //Act
            var target = new EditMapper();
            var actual = target.Map(data);

            //Assert
            Assert.IsInstanceOf<List<parameterschoolmap>>(actual);
        }
    }
}
