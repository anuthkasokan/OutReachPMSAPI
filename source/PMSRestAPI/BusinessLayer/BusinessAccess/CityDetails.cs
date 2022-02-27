using BusinessLayer.Interface;
using BusinessLayer.Mapper;
using BusinessLayer.Model;
using DataAccessLayer;
using DataAccessLayer.DataAccess;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;


namespace BusinessLayer.BusinessAccess
{
    public class CityDetails : IGetDetails<City>
    {
        private IGetDatas<city> _cityData;
        private IMapper<city, City> _cityMapper;

        public  CityDetails()
        {
            _cityData = new CityData();
            _cityMapper = new CityMapper();
        }

        public CityDetails(IGetDatas<city> cityData, IMapper<city, City> cityMapper)
        {
            _cityData = cityData;
            _cityMapper = cityMapper;
        }


        public List<City> GetDetails()
        {
            List<City> City = new List<City>();
            var cityDetails = _cityData.GetData();
            foreach(var city in cityDetails)
            {
                City.Add(_cityMapper.Map(city));
            }
            return City;
        }
    }
}
