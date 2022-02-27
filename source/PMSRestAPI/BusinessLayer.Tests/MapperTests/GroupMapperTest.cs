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
    class GroupMapperTest
    {

        [SetUp]
        public void SetUp()
        {

        }

        [Test]
        public void Map_GroupFromDataAccess_ReturnGroupForDetails()
        {
            group groupDetail = new group();
            groupDetail.groupid = 1;
            groupDetail.groupname = "1st A";

            var expected = new Group();
            expected.groupid = 1;
            expected.groupname = "1st A";

            //Act
            var target = new GroupMapper();
            var actual = target.Map(groupDetail);

            //Assert
            Assert.IsInstanceOf<Group>(actual);
            Assert.AreEqual(expected.groupid, actual.groupid);
        }
    }
}
