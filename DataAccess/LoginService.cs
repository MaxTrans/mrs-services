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
                user.Id = dr["Id"].ToString();
                user.FirstName = dr["FirstName"].ToString();
                user.LastName = dr["LastName"].ToString();
                user.LoginName = dr["LoginName"].ToString();
                user.PhoneNo = dr["PhoneNo"].ToString();
                user.RoleName = dr["RoleName"].ToString();
                user.Email = dr["Email"].ToString();
                user.CompanyName = dr["CompanyName"].ToString();
            });


            return  dbresult.IsSuccess ? user : null;
        }
    }
}
