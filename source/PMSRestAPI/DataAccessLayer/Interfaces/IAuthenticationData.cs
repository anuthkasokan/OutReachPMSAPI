﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IAuthenticationData
    {
        user CheckCredential(string emailid, string password);
    }
}