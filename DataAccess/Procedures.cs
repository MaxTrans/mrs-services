﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public static class Procedures
    {
        public static class Jobs
        {
            public const string USP_GETJOBS = "USP_GetJobs";
            public const string USP_SAVEJOB = "usp_SaveJob";
        }

        public static class LookUp
        {
            public const string USP_GETUSERLOOKUP = "USP_GetUserLookup";
            public const string USP_GETLOOKUPDATA = "USP_GetLookupData";
        }

        public static class Notification
        {
            public const string USP_GETNOTIFICATIONS = "USP_GetNotifications";
            public const string USP_INSERTNOTIFICATION = "USP_InsertNotification";
        }
    }
}
