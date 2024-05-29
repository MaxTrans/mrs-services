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
    public class UserService : DataContext
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

        public List<Client> GetClients()
        {
            try
            {
                this.ProcedureName = Procedures.User.USP_GETCLIENTS;
                var clients = new List<Client>();

                var dbresult = this.ExecuteReader((dr) => {
                    clients.Add(new Client
                    {
                        Id = dr["Id"].ToStr(),
                        UserId = dr["UserId"].ToStr(),
                        ClientType = dr["ClientType"].ToStr(),
                        ClientName = dr["ClientName"].ToStr(),
                        FirstName = dr["FirstName"].ToStr(),
                        LastName = dr["LastName"].ToStr(),
                        LoginName = dr["LoginName"].ToStr(),
                        Password = dr["Password"].ToStr(),
                        PhoneNo = dr["PhoneNo"].ToStr(),
                        Email = dr["Email"].ToStr(),
                        RoleName = dr["RoleName"].ToStr(),
                        CompanyId = dr["CompanyId"].ToStr(),
                        CompanyName = dr["CompanyName"].ToStr(),
                        Details = dr["Details"].ToStr(),
                        Website = dr["Website"].ToStr(),
                        Address1 = dr["Address1"].ToStr(),
                        Address2 = dr["Address2"].ToStr(),
                        City = dr["City"].ToStr(),
                        StateId = dr["StateId"].ToInt(),
                        CountryId = dr["CountryId"].ToInt(),
                        DefaultTAT = dr["DefaultTAT"].ToInt(),
                        FilePreferencePDF = dr["FilePreferencePDF"].ToBool(),
                        FilePreferenceWord = dr["FilePreferenceWord"].ToBool(),
                        FilePreferencePDFLink = dr["FilePreferencePDFLink"].ToBool(),
                        ClientLogo = dr["ClientLogo"].ToStr(),
                        CreatedDateTime = dr["CreatedDateTime"].ToDateTime(),
                        IsDeleted = dr["IsDeleted"].ToBool(),
                        ModifiedDateTime = dr["ModifiedDateTime"].ToDateTime(),
                        FilePreference = dr["FilePreference"].ToStr(),
                        CreatedBy = dr["CreatedBy"].ToStr(),
                        ModifyedBy = dr["ModifyedBy"].ToStr()
                    });
                });

                return clients;

            }
            catch
            {
                throw;
            }
        }

        public bool UpdatePassword(string userId, string password)
        {
            try
            {
                this.ProcedureName = Procedures.User.USP_UPDATEPASSWORD;
                this.AddParameter("@UserId", userId);
                this.AddParameter("@Password", password);
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
