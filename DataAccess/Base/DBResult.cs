﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Base
{
    public class DBResult
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public int ResultCount { get; set; }
    }
}
