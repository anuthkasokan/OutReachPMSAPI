using BusinessLayer.Interface;
using BusinessLayer.Model;
using BusinessLayer.Mapper;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.DataAccess;

namespace BusinessLayer.BusinessAccess
{
    public class StarDetails:IStarDetails<StarWisePerformance>
    {
        private IPerformanceData<studentdailyperformance> _studentPerformanceData;
        private IMapper<List<studentdailyperformance>, StarWisePerformance> _starMapper;

        public StarDetails()
        {
            _studentPerformanceData = new StudentDailyPerformanceData();
            _starMapper = new StarFillingMapper();
        }

        public StarWisePerformance GetDetailsForCity(int cityid)
        {
            StarWisePerformance starData = new StarWisePerformance();

            var performanceDetails = _studentPerformanceData.GetDataByCityID(cityid);

            starData = _starMapper.Map(performanceDetails);

            return starData;
        }

        public StarWisePerformance GetDetails(int schoolid)
        {
            StarWisePerformance starData = new StarWisePerformance();

            var performanceDetails = _studentPerformanceData.GetDataBySchoolID(schoolid);

            starData = _starMapper.Map(performanceDetails);

            return starData;
        }

        public StarWisePerformance GetDetails(int schoolid,int classid)
        {
            StarWisePerformance starData = new StarWisePerformance();

            var performanceDetails = _studentPerformanceData.GetDataByClassID(schoolid,classid);

            starData = _starMapper.Map(performanceDetails);

            return starData;
        }

        public StarWisePerformance GetDetailsForStudent(int studentid)
        {
            StarWisePerformance starData = new StarWisePerformance();

            var performanceDetails = _studentPerformanceData.GetDataByStudentID(studentid);

            starData = _starMapper.Map(performanceDetails);

            return starData;
        }

        public StarWisePerformance GetDetailsForGroup(int groupid)
        {
            StarWisePerformance starData = new StarWisePerformance();

            var performanceDetails = _studentPerformanceData.GetGroupDataByGroupID(groupid);

            starData = _starMapper.Map(performanceDetails);

            return starData;
        }

        public StarWisePerformance GetGroupDetailsForClass(int groupid,int classid)
        {
            StarWisePerformance starData = new StarWisePerformance();

            var performanceDetails = _studentPerformanceData.GetGroupDataByGroupID(groupid,classid);

            starData = _starMapper.Map(performanceDetails);

            return starData;
        }
    }
}
