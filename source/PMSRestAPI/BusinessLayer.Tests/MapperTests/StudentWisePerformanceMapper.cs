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
    class StudentWisePerformanceMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_StudentWisePerformFromDataAccess_ReturnStudentWisePerformForDetails()
        {
            //Arrange
            List<studentdailyperformance> performances = new List<studentdailyperformance>
            {
                new studentdailyperformance {Attendance=1,HomeWork=1,Discipline=1}
            };
            student studentDetail = new student();
            studentDetail.studentid = 1;
            studentDetail.studentname = "Biju";
            studentDetail.studentschoolmaps = new List<studentschoolmap>
            {
                new studentschoolmap
                {
                    studentid=1,
                    rollnumber="1"
                }
            };

            var expected = new StudentWisePerformance();
            expected.StudentId = 1;
            expected.StudentName = "Biju";
            expected.RollNumber = "1";
            expected.Attendance = 5;
            expected.Homework = 5;
            expected.Discipline = 5;
            expected.Points = 20;


            //Act
            var target = new StudentWisePerformanceMapper();
            var actual = target.Map(studentDetail, performances);

            //Assert
            Assert.IsInstanceOf<StudentWisePerformance>(actual);
            Assert.AreEqual(expected.StudentId, actual.StudentId);
        }
    }
}
