using System.Collections.Generic;
using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;

namespace BusinessLayer.BusinessAccess
{
    public class StudentDetails : IGetDetailsBy2Id<Student>
    {
        private IStudentData<student> _studentData;
        private IMapper<student,Student> _studentMapper;

        public StudentDetails()
        {
            _studentData = new StudentData();
            _studentMapper = new StudentMapper();
        }

        public List<Student> GetDetails(int schoolid, int classid)
        {
            List<Student> students = new List<Student>();
            var studentDetails = _studentData.GetData(schoolid, classid);
            foreach(var student in studentDetails)
            {
                students.Add(_studentMapper.Map(student));
            }
            return students;
        }
    }
}
