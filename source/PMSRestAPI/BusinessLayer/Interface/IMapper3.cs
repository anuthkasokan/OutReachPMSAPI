using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    internal interface IMapper3<TRequest1, TRequest2,TRequest3, TResponse>
    {
        TResponse Map(TRequest1 request1, TRequest2 request2, TRequest3 request3);
    }

}
