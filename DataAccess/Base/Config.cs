using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Base
{
    public class Config
    {
        private readonly IConfiguration _configuration;

      
        public Config(IConfiguration configuration)
        {
            this._configuration = configuration;
        }

        public string? Get(string name)
        {
            return this._configuration[name];
        }

        public string? ConnectionString {
            get { return this._configuration["ConnectionStrings:ConnStr"]; }
        }
    }
}
