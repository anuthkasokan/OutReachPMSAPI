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
    class SchoolMapperTest
    {


        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_SchoolFromDataAccess_ReturnSchoolForDetails()
        {
            school schoolDetail = new school();
            schoolDetail.schoolid = 1;
            schoolDetail.schoolname = "Thrikkakar Govt High School";

            var expected = new School();
            expected.schoolid = 1;
            expected.schoolname = "Thrikkakar Govt High School";

            //Act
            var target = new SchoolMapper();
            var actual = target.Map(schoolDetail);

            //Assert
            Assert.IsInstanceOf<School>(actual);
            Assert.AreEqual(expected.schoolid, actual.schoolid);
        }
    }
}
