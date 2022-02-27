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
    public class GroupDetailsTest
    {
        private Mock<IGetDatasById<group>> _mockGroupData;
        private Mock<IMapper<group, Group>> _mockGroupMapper;

        [SetUp]
        public void SetUp()
        {
            _mockGroupData = new Mock<IGetDatasById<group>>();
            _mockGroupMapper = new Mock<IMapper<group, Group>>();
        }

        [Test]
        public void GetDetails_WithSchoolid_ReturnGroupList()
        {
            //Arrange

            List<group> groupList = new List<group>
            {
                new group
                {
                groupid=1,
                groupname="Strawberry"
                }
            };
            group groupDetails = new group
            {
                groupid = 1,
                groupname = "Strawberry"
            };

            Group mappedGroup = new Group
            {
                groupid = 1,
                groupname = "Strawberry"
            };

            var expected = new List<Group>
            {
                  new Group
                {
                groupid=1,
                groupname="Strawberry"
                }
            };

            _mockGroupData.Setup(data => data.GetData(1)).Returns(groupList);
            _mockGroupMapper.Setup(map => map.Map(It.IsAny<group>())).Returns(mappedGroup);

            //Act
            var target = new GroupDetails(_mockGroupData.Object, _mockGroupMapper.Object);
            var actual = target.GetDetails(1);

            //Assert
            Assert.IsInstanceOf<List<Group>>(actual);
            Assert.AreEqual(expected[0].groupid, actual[0].groupid);
        }
    }
}
