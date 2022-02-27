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
    class StudentMapperTest
    {

        [SetUp]
        public void SetUp()
        {
      
        }

        [Test]
        public void Map_StudentFromDataAccess_ReturnStudentForDetails()
        {
            student studentDetail = new student();
            studentDetail.studentid = 1;
            studentDetail.studentname = "Biju";

            var expected = new Student();
            expected.studentid = 1;
            expected.studentname = "Biju";

            //Act
            var target = new StudentMapper();
            var actual = target.Map(studentDetail);

            //Assert
            Assert.IsInstanceOf<Student>(actual);
            Assert.AreEqual(expected.studentid, actual.studentid);
        }
    }
}
