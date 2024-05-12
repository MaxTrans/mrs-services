using BusinessEntity;
using DataAccess.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class JobService : DataContext
    {
        public DBResult DeleteJob(string jobId, string userId)
        {
            this.ProcedureName = Procedures.Jobs.USP_DELETEJOB;
            this.AddParameter("@JobId", jobId);
            this.AddParameter("@UserId", userId);
            return this.ExecuteNonQuery();
        }

        public List<Job> GetJob(string userId, string jobStatus, string createdBy) 
        {
            this.ProcedureName = Procedures.Jobs.USP_GETJOBS;
            this.AddParameter("@JobStatus", jobStatus);
            this.AddParameter("@CreatedBy", createdBy);
            this.AddParameter("@UserId", userId);

            var jobs = new List<Job>();

            var dbresult = this.ExecuteReader((dr) => {
                jobs.Add(new Job { 
                    Id = dr["Id"].ToStr(),
                    JobId = dr["JobId"].ToInt(),
                    AssignTo = dr["AssignTo"].ToStr(),
                    CompanyId = dr["CompanyId"].ToStr(),
                    CreatedBy = dr["CreatedBy"].ToStr(),
                    CreatedDateTime = dr["CreatedDateTime"].ToDateTime(),
                    IsDeleted = dr["IsDeleted"].ToBool(),
                    IsSingleJob = dr["IsSingleJob"].ToBool(),
                    JobFiles = dr["JobFiles"].ToStr(),
                    L1User = dr["L1User"].ToStr(),
                    L2User = dr["L2User"].ToStr(),
                    L3User = dr["L3User"].ToStr(),
                    ModifiedDateTime = dr["ModifiedDateTime"].ToDateTime(),
                    ModifyedBy = dr["ModifyedBy"].ToStr(),
                    Name = dr["Name"].ToStr(),
                    Notes = dr["Notes"].ToStr(),
                    ParentJobId = dr["ParentJobId"].ToStr(),
                    Priority = dr["Priority"].ToStr(),
                    Status = dr["Status"].ToStr(),
                    StatusName = dr["StatusName"].ToStr(),
                    UserName = dr["UserName"].ToStr(),
                    UnReadMessages = dr["UnReadMessages"].ToInt(),
                    FilePreference = dr["FilePreference"].ToStr(),
                    Tat = dr["Tat"].ToStr(),
                });
            });

            return jobs;
        }

    }
}

