using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;
using BusinessEntity;
using DataAccess.Base;

namespace DataAccess
{
    public class UserService: DataContext
    {
        public UserService()
        {
                
        }

        public bool SavePreferences(string userId, string website, string defaultTat, bool isPdfAlowed, bool isDocAllowed)
        {
            try
            {
                this.ProcedureName = Procedures.User.USP_SAVEPREFERENCES;
                this.AddParameter("@UserId", userId);
                this.AddParameter("@Website", website);
                this.AddParameter("@DefaultTat", defaultTat);
                this.AddParameter("@IsPDFAllowed", isPdfAlowed);
                this.AddParameter("@IsDocAllowed", isDocAllowed);
                var result = this.ExecuteNonQuery((cmd) =>
                {

                });

                return result.IsSuccess;
            }
            catch 
            { 
                return false;
            }
        }
    }
}
