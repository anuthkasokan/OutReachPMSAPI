using System.Collections.Generic;
using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;

namespace BusinessLayer.BusinessAccess
{
    public class ClassDetails : IGetDetails<Class>
    {
        private IGetDatas<@class> _classData;
        private IMapper<@class, Class> _classMapper;

        public ClassDetails()
        {
            _classData = new ClassData();
            _classMapper = new ClassMapper();
        }

        public ClassDetails(IGetDatas<@class> classData, IMapper<@class, Class> classMapper)
        {
            _classData = classData;
            _classMapper = classMapper;
        }

        public List<Class> GetDetails()
        {
            List<Class> classes = new List<Class>();
            var classsDetails = _classData.GetData();
            foreach(var item in classsDetails)
            {
                classes.Add(_classMapper.Map(item));
            }
            return classes;
         }
    }
}
