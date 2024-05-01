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
using static DataAccess.Procedures;

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
                this.ProcedureName = Procedures.Jobs.USP_SAVEJOB;
                this.AddParameter("@JobFiles", jobFiles);
                this.AddParameter("@JobName", jobName);
                this.AddParameter("@Priority", priority);
                this.AddParameter("@Notes", notes);
                this.AddParameter("@IsSingleJob", isSingleJob);
                this.AddParameter("@CompanyId", companyId);
                this.AddParameter("@CreatedBy", createdBy);
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

        public bool SaveAdminFileUpload(DataTable jobFiles, string jobId, string createdBy)
        {
            try
            {
                this.ProcedureName = Procedures.Jobs.USP_ADMINSAVEUPLOADFILE;
                this.AddParameter("@JobFiles", jobFiles);
                this.AddParameter("@JobId", jobId);
                this.AddParameter("@CreatedBy", createdBy);
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

        public List<UploadPreference> GetUploadTypes(string userId)
        {
            var uploadPreferences = new List<UploadPreference>();
            var allowedFiles = string.Empty;
            try
            {
                this.ProcedureName = Procedures.Jobs.USP_GETUPLOADPREFERENCES;
                this.AddParameter("@UserId", userId);
                var dbresult = this.ExecuteReader((dr) => {
                    uploadPreferences.Add(new UploadPreference
                    {
                        Type = dr["Type"].ToStr(),
                        Selected = dr["Selected"].ToBool()
                    });
                });

            }
            catch
            {
                throw;
            }
            return uploadPreferences;
        }

    }
}
