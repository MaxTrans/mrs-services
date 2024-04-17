using BusinessEntity;
using DataAccess.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class LoginService : DataContext
    {
        public LoginService() { }

        public User VerifyLogin(string username, string password) {
            this.ProcedureName = "USP_VerifyLogin";
            this.AddParameter("@LoginName", username);
            this.AddParameter("@Password", password);

            var user = new User();

            var dbresult = this.ExecuteReader((dr) => {
                user.Id = dr["Id"].ToStr();
                user.FirstName = dr["FirstName"].ToStr();
                user.LastName = dr["LastName"].ToStr();
                user.LoginName = dr["LoginName"].ToStr();
                user.PhoneNo = dr["PhoneNo"].ToStr();
                user.RoleName = dr["RoleName"].ToStr();
                user.Email = dr["Email"].ToStr();
                user.CompanyId = dr["CompanyId"].ToStr();
                user.CompanyName = dr["CompanyName"].ToStr();
            });


            return  dbresult.IsSuccess ? user : null;
        }
    }
}
