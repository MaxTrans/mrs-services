﻿using System.Security.AccessControl;
using System.Security.Cryptography;

namespace MaxTransApi
{
    public class RefreshTokenGenerator : DisposeLogic, IRefreshTokenGenerator
    {
        //private readonly Learn_DBContext context;

        public RefreshTokenGenerator()
        {
            //context = learn_DB;
        }
        public string GenerateToken(string username)
        {
            var randomnumber = new byte[32];
            using (var randomnumbergenerator = RandomNumberGenerator.Create())
            {
                randomnumbergenerator.GetBytes(randomnumber);
                string RefreshToken = Convert.ToBase64String(randomnumber);

                //DOING DOING
                //var commonBL = new CommonBL(new ObjectDataConnection());
                //AppSystemObject obj = new AppSystemObject { Action = "", ActionType = "", ObjectName = "", ParamsJson = "" };
                //var _pp = commonBL.ManageAuth(obj, "nritdp");

                //var _user = context.TblRefreshtoken.FirstOrDefault(o => o.UserId == username);
                //if (_user != null)
                //{
                //    _user.RefreshToken = RefreshToken;
                //    context.SaveChanges();
                //}
                //else
                //{
                //    TblRefreshtoken tblRefreshtoken = new TblRefreshtoken()
                //    {
                //        UserId = username,
                //        TokenId = new Random().Next().ToString(),
                //        RefreshToken = RefreshToken,
                //        IsActive = true
                //    };
                //}

                return RefreshToken;
            }
        }
    }
}
