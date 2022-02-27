using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.DataAccess
{
    public class StudentData : IStudentData<student>
    {
        outreachpmsEntities pmsDb = new outreachpmsEntities();
        public StudentData()
        { }

        public List<student> GetData(int schoolId,int classId)
        {
            var studentDetails = from st in pmsDb.students
                                 join ss in pmsDb.studentschoolmaps on st.studentid equals ss.studentid
                                 where ss.schoolid == schoolId && ss.classid == classId
                                 select st;
            return studentDetails.ToList();

        }

        public List<student> GetGroupData(int groupId, int classId)
        {
            var studentDetails = from st in pmsDb.students
                                 join ss in pmsDb.studentschoolmaps on st.studentid equals ss.studentid
                                 where ss.groupid == groupId && ss.classid == classId
                                 select st;
            return studentDetails.ToList();

        }

        public student GetData(int studentId)
        {
            var studentDetail = from st in pmsDb.students
                                where st.studentid == studentId
                                select st;

            return studentDetail.FirstOrDefault();
        }
    }
}
