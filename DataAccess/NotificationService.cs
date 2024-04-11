using BusinessEntity;
using DataAccess.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class NotificationService : DataContext
    {
        public List<Notification> GetNotifications(string jobId)
        {
            this.ProcedureName = Procedures.Notification.USP_GETNOTIFICATIONS;
            this.AddParameter("@JobId", jobId);

            var notifications = new List<Notification>();

            var dbresult = this.ExecuteReader((dr) => {
                notifications.Add(new Notification
                {
                    Id = dr["Id"].ToStr(),
                    JobId = dr["JobId"].ToStr(),
                    Comments = dr["Comments"].ToStr(),
                    IsReadMessage = dr["IsReadMessage"].ToBool(),
                    CreatedByName = dr["CreatedByName"].ToStr(),
                    CreatedDateTime = dr["CreatedDateTime"].ToDateTime()
                });
            });

            return notifications;
        }

        public int SaveNotification(Notification notification)
        {
            this.ProcedureName = Procedures.Notification.USP_INSERTNOTIFICATION;
            this.AddParameter("@JobId", notification.JobId);
            this.AddParameter("@UserId", notification.UserId);
            this.AddParameter("@Comments", notification.Comments);

            var dbresult = this.ExecuteNonQuery();
            return dbresult.ResultCount;
        }
    }
}
