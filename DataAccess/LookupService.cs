using BusinessEntity;
using DataAccess.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class LookupService : DataContext
    {
        public List<Lookup> GetUsers(string role)
        {
            this.ProcedureName = Procedures.LookUp.USP_GETUSERLOOKUP;
            this.AddParameter("@Role", role);

            var userlookup = new List<Lookup>();

            var dbresult = this.ExecuteReader((dr) => {
                userlookup.Add(new Lookup
                {
                    Id = dr["Id"].ToStr(),
                    Value = dr["Value"].ToStr()
                });
            });

            return userlookup;
        }

        public List<Lookup> GetStatus(string type)
        {
            this.ProcedureName = Procedures.LookUp.USP_GETLOOKUPDATA;
            this.AddParameter("@Type", type);

            var lookups = new List<Lookup>();

            var dbresult = this.ExecuteReader((dr) => {
                lookups.Add(new Lookup
                {
                    Id = dr["Id"].ToStr(),
                    Value = dr["Value"].ToStr()
                });
            });

            return lookups;
        }
    }
}
