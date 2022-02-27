using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;

namespace BusinessLayer.Mapper
{
    public class StudentMapper : IMapper<student, Student>,IMapper<studentschoolmap,StudentSchoolMap>
    {
        public Student Map(student studentIn)
        {
            Student student = new Student();
            student.studentid = studentIn.studentid;
            student.studentname = studentIn.studentname;
            return student;
        }

        public StudentSchoolMap Map(studentschoolmap studentIn)
        {
            StudentSchoolMap student = new StudentSchoolMap();
            student.StudentSchoolMapId = studentIn.studentschoolmapid;

            return student;
        }
    }
}
