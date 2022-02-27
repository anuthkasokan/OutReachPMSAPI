using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;

namespace BusinessLayer.BusinessAccess
{
    public class ChartDetails : IChartDetails
    {
        private IChartData _chartData;
        private IMapper<List<studentdailyperformance>, int> _chartMapper;

        public ChartDetails()
        {
            _chartData = new ChartData();
            _chartMapper = new ChartMapper();
        }

        public ChartDetails(IChartData chartData, IMapper<List<studentdailyperformance>, int> chartMapper)
        {
            _chartData = chartData;
            _chartMapper = chartMapper;
        }


        public List<int> GetPointsForCityChart(int cityid)
        {
            List<int> chartData = new List<int>();

            List<string> months = _chartData.GetMonths();

            foreach (var month in months)
            {
                var performanceList = _chartData.GetCityDataForChart(cityid,Convert.ToInt32(month.Split('/')[0]));

                chartData.Add(_chartMapper.Map(performanceList));
            }

            return chartData;
        }

        public List<int> GetPointsForSchoolChart(int schoolid)
        {
            List<int> chartData = new List<int>();

            List<string> months = _chartData.GetMonths();

            foreach (var month in months)
            {
                var performanceList = _chartData.GetSchoolDataForChart(schoolid, Convert.ToInt32(month.Split('/')[0]));

                chartData.Add(_chartMapper.Map(performanceList));
            }

            return chartData;
        }

        public List<int> GetPointsForClassChart(int schoolid,int classid)
        {
            List<int> chartData = new List<int>();

            List<string> months = _chartData.GetMonths();

            foreach (var month in months)
            {
                var performanceList = _chartData.GetClassDataForChart(schoolid,classid, Convert.ToInt32(month.Split('/')[0]));

                chartData.Add(_chartMapper.Map(performanceList));
            }

            return chartData;
        }

        public List<int> GetPointsForStudentChart(int studentid)
        {
            List<int> chartData = new List<int>();

            List<string> months = _chartData.GetMonths();

            foreach (var month in months)
            {
                var performanceList = _chartData.GetStudentDataForChart(studentid, Convert.ToInt32(month.Split('/')[0]));

                chartData.Add(_chartMapper.Map(performanceList));
            }

            return chartData;
        }

        public List<int> GetPointsForGroupChart(int groupid)
        {
            List<int> chartData = new List<int>();

            List<string> months = _chartData.GetMonths();

            foreach (var month in months)
            {
                var performanceList = _chartData.GetGroupDataForChart(groupid, Convert.ToInt32(month.Split('/')[0]));

                chartData.Add(_chartMapper.Map(performanceList));
            }

            return chartData;
        }

        public List<int> GetPointsForClassWiseGroupChart(int groupid,int classid)
        {
            List<int> chartData = new List<int>();

            List<string> months = _chartData.GetMonths();

            foreach (var month in months)
            {
                var performanceList = _chartData.GetGroupDataForChart(groupid,classid, Convert.ToInt32(month.Split('/')[0]));

                chartData.Add(_chartMapper.Map(performanceList));
            }

            return chartData;
        }

        public double GetIncreaseInPerForCity(int cityid)
        {

            int currentPer = _chartMapper.Map(_chartData.GetCityDataForChart(cityid, Convert.ToInt32(DateTime.Now.AddMonths(-1).Month)));
            int prevPerformance= _chartMapper.Map(_chartData.GetCityDataForChart(cityid, Convert.ToInt32(DateTime.Now.AddMonths(-2).Month)));

            if(currentPer ==0 || prevPerformance==0)
            {
                return 100;
            }
            else if(currentPer == 0 && prevPerformance == 0)
            {
                return 0;
            }
            else
            {
              return  ((currentPer - prevPerformance) / prevPerformance) * 100;
            }
        
        }

        public double GetIncreaseInPerForSchool(int schoolid)
        {

            int currentPer = _chartMapper.Map(_chartData.GetSchoolDataForChart(schoolid, Convert.ToInt32(DateTime.Now.AddMonths(-1).Month)));
            int prevPerformance = _chartMapper.Map(_chartData.GetSchoolDataForChart(schoolid, Convert.ToInt32(DateTime.Now.AddMonths(-2).Month)));

            if (currentPer == 0 || prevPerformance == 0)
            {
                return 100;
            }
            else if (currentPer == 0 && prevPerformance == 0)
            {
                return 0;
            }
            else
            {
                return ((currentPer - prevPerformance) / prevPerformance) * 100;
            }

        }

        public double GetIncreaseInPerForClass(int schoolid,int classid)
        {

            int currentPer = _chartMapper.Map(_chartData.GetClassDataForChart(schoolid,classid, Convert.ToInt32(DateTime.Now.AddMonths(-1).Month)));
            int prevPerformance = _chartMapper.Map(_chartData.GetClassDataForChart(schoolid,classid, Convert.ToInt32(DateTime.Now.AddMonths(-2).Month)));

            if (currentPer == 0 || prevPerformance == 0)
            {
                return 100;
            }
            else if (currentPer == 0 && prevPerformance == 0)
            {
                return 0;
            }
            else
            {
                return ((currentPer - prevPerformance) / prevPerformance) * 100;
            }

        }

        public double GetIncreaseInPerForStudent(int studentid)
        {

            int currentPer = _chartMapper.Map(_chartData.GetStudentDataForChart(studentid, Convert.ToInt32(DateTime.Now.AddMonths(-1).Month)));
            int prevPerformance = _chartMapper.Map(_chartData.GetStudentDataForChart(studentid, Convert.ToInt32(DateTime.Now.AddMonths(-2).Month)));

            if (currentPer == 0 || prevPerformance == 0)
            {
                return 100;
            }
            else if (currentPer == 0 && prevPerformance == 0)
            {
                return 0;
            }
            else
            {
                return ((currentPer - prevPerformance) / prevPerformance) * 100;
            }

        }

        public double GetIncreaseInPerForGroupForSchool(int groupid)
        {

            int currentPer = _chartMapper.Map(_chartData.GetGroupDataForChart(groupid, Convert.ToInt32(DateTime.Now.AddMonths(-1).Month)));
            int prevPerformance = _chartMapper.Map(_chartData.GetGroupDataForChart(groupid, Convert.ToInt32(DateTime.Now.AddMonths(-2).Month)));

            if (currentPer == 0 || prevPerformance == 0)
            {
                return 100;
            }
            else if (currentPer == 0 && prevPerformance == 0)
            {
                return 0;
            }
            else
            {
                return ((currentPer - prevPerformance) / prevPerformance) * 100;
            }

        }

        public double GetIncreaseInPerForGroupForClass(int groupid,int classid)
        {

            int currentPer = _chartMapper.Map(_chartData.GetGroupDataForChart(groupid,classid, Convert.ToInt32(DateTime.Now.AddMonths(-1).Month)));
            int prevPerformance = _chartMapper.Map(_chartData.GetGroupDataForChart(groupid,classid, Convert.ToInt32(DateTime.Now.AddMonths(-2).Month)));

            if (currentPer == 0 || prevPerformance == 0)
            {
                return 100;
            }
            else if (currentPer == 0 && prevPerformance == 0)
            {
                return 0;
            }
            else
            {
                return ((currentPer - prevPerformance) / prevPerformance) * 100;
            }

        }

        public List<string> GetMonthsForChart()
        {
            return _chartData.GetMonths();
        }
    }
}
