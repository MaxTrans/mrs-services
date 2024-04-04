using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessEntity;
using DataAccess.Base;

namespace DataAccess
{
    public class UploadService: DataContext
    {
        public UploadService()
        {
                
        }

        public bool SaveJob(DataTable jobFiles, string jobName, string priority, string notes, bool isSingleJob, string companyId, string createdBy)
        {
            try
            {
                this.ProcedureName = "usp_SaveJob";
                this.AddParameter("@JobFiles", jobFiles);
                this.AddParameter("@JobName", jobName);
                this.AddParameter("@Priority", priority);
                this.AddParameter("@Notes", notes);
                this.AddParameter("@IsSingleJob", isSingleJob);
                this.AddParameter("@CompanyId", companyId);
                this.AddParameter("@CreatedBy", createdBy);
                var result = this.ExecuteNonQuery((cmd) =>
                {
                    cmd.ExecuteNonQuery();
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
