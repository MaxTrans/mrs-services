using System;
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
            public const string USP_ADMINSAVEUPLOADFILE = "usp_AdminSaveUploadFile";
            public const string USP_GETUPLOADPREFERENCES = "usp_GetUploadPreferences";
            public const string USP_UPDATEPAGECOUNT = "usp_UpdatePageCount";
            public const string USP_DELETEJOB = "usp_DeleteJob";
            public const string USP_UPDATE_JOBSTATUS = "usp_UpdateJobStatus";
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

        public static class User
        {
            public const string USP_SAVEPREFERENCES = "usp_SavePreferences";
        }
    }
}
