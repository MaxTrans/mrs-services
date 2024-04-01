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
        public List<Job> GetJob(string jobStatus, string createdBy) 
        {
            this.ProcedureName = Procedures.Jobs.USP_GETJOBS;
            this.AddParameter("@JobStatus", jobStatus);
            this.AddParameter("@CreatedBy", createdBy);

            var jobs = new List<Job>();

            var dbresult = this.ExecuteReader((dr) => {
                jobs.Add(new Job { 
                    Id = dr["Id"].ToStr(),
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
                    StatusName = dr["StatusName"].ToStr()
                });
            });

            return jobs;
        }

    }
}
