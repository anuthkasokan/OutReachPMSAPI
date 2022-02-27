using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
     public interface IMapper2<TRequest1,TRequest2,TResponse>
    {
        TResponse Map(TRequest1 request1, TRequest2 request2);
    }
}
