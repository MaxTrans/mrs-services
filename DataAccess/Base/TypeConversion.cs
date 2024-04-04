using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Base
{
    public static class TypeConversion
    {
        public static string ToStr(this object value)
        {
            string res = string.Empty;
            if (value == null || value == DBNull.Value)
                return res;
            else
                return value.ToString();
        }

        public static bool ToBool(this object value)
        {
            bool res;
            bool.TryParse(value.ToStr(), out res);
            return res;
        }
        public static DateTime ToDateTime(this object value)
        {
            DateTime res;
            DateTime.TryParse(value.ToStr(), out res);
            return res;
        }
    }
}
