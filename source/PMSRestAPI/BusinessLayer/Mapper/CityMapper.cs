using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Mapper
{
    public class CityMapper : IMapper<city, City>
    {
        public City Map(city cityIn)
        {
            City city = new City();
            city.cityid = cityIn.cityid;
            city.cityname = cityIn.cityname;
            return city;
        }
    }
}
