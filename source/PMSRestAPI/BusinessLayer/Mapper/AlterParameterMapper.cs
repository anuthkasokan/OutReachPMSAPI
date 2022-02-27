using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLayer.Interface;
using BusinessLayer.Model;
using DataAccessLayer;

namespace BusinessLayer.Mapper
{
    public class AlterParameterMapper: IMapper<List<parameterschoolmap>,Parameter>
    {
        public Parameter Map(List<parameterschoolmap> alterParameters)
        {
            Parameter alterParamter = new Parameter();

            foreach(var alter in alterParameters)
            {
                if(alter.parameterid==1)
                {
                    alterParamter.Attendance = alter.alterparameter;
                }
                if (alter.parameterid == 2)
                {
                    alterParamter.Homework = alter.alterparameter;
                }
                if (alter.parameterid == 3)
                {
                    alterParamter.Discipline = alter.alterparameter;
                }
            }

            return alterParamter;
        }
    }
}
