using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.BusinessAccess
{
    public class SchoolDetails : ISchoolDetails<School>
    {
        private ISchoolData<school> _schoolData;
        private IMapper<school, School> _schoolMapper;
        private IGetDatasById<parameterschoolmap> _paramData;
        private IMapper<List<parameterschoolmap>, Parameter> _alterParameter;

        public SchoolDetails()
        {
            _schoolData = new SchoolData();
            _paramData = new ParameterData();
            _schoolMapper = new SchoolMapper();
            _alterParameter = new AlterParameterMapper();
        }

        public SchoolDetails(ISchoolData<school> schoolData, IMapper<school, School> schoolMapper, IGetDatasById<parameterschoolmap> paramData, IMapper<List<parameterschoolmap>, Parameter> alterParameter)
        {
            _schoolData = schoolData;
            _paramData = paramData;
            _schoolMapper = schoolMapper;
            _alterParameter = alterParameter;
        }

        public List<School> GetSchoolListById(int cityId)
        {
            List<School> schools = new List<School>();
            var schoolDetails = _schoolData.GetDataByCityID(cityId);
            foreach (var school in schoolDetails)
            {
                schools.Add(_schoolMapper.Map(school));
            }
            return schools;
        }

        public List<School> GetSchoolList()
        {
            List<School> schools = new List<School>();
            var schoolDetails = _schoolData.GetData();

            foreach (var school in schoolDetails)
            {
                schools.Add(_schoolMapper.Map(school));
            }
            return schools;
        }

        public Parameter GetAlterParameters(int schoolid)
        {
            Parameter alterParameter = new Parameter();

            var parameters= _paramData.GetData(schoolid);

            alterParameter = _alterParameter.Map(parameters);

            return alterParameter;
        }
    }
}
