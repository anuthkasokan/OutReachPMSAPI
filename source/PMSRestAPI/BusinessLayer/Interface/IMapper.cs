using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface IMapper<TRequest,TResponse>
    {
        TResponse Map(TRequest request);
    }
}
