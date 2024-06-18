using BusinessEntity;
using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace MaxTransApi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : ControllerBase
    {
        [HttpGet]
        [Route("getjobs")]
        public async Task<IActionResult> GetJobs(string userId, string? jobStatus, string? createdBy, string? filename, string? fromDate, string? toDate, bool initialLoad)
        {
            try {
                var jobs = new JobService().GetJob(userId, jobStatus, createdBy, filename, fromDate, toDate, initialLoad);
                return Ok(new ApiResult
                {
                    Data = jobs,
                    IsSuccess = true
                });
            }
            catch (Exception ex)
            {
                return Ok(new ApiResult
                {
                    Data = null,
                    IsSuccess = false,
                    Message = ex.Message
                });
            }
        }

        [HttpGet]
        [Route("deletejob")]
        public async Task<IActionResult> DeleteJob(string jobId, string userId, string status)
        {
            try
            {
                var res = new JobService().DeleteJob(jobId, userId, status);
                return Ok(new ApiResult
                {
                    Data = res.ResultCount,
                    IsSuccess = res.IsSuccess
                });
            }
            catch (Exception ex)
            {
                return Ok(new ApiResult
                {
                    Data = null,
                    IsSuccess = false,
                    Message = ex.Message
                });
            }
        }

        [HttpPost]
        [Route("mergejobs")]
        public async Task<IActionResult> MergeJobs(MergeJob job)
        {
            try
            {
                var res = new JobService().MergeJobs(string.Join(",", job.JobIds), job.Userid,job.CreatedBy, job.CompanyId);
                return Ok(new ApiResult
                {
                    Data = res.ResultCount,
                    IsSuccess = true
                });
            }
            catch (Exception ex)
            {
                return Ok(new ApiResult
                {
                    Data = null,
                    IsSuccess = false,
                    Message = ex.Message
                });
            }
        }

        [HttpGet]
        [Route("updateJobStatus")]
        public async Task<IActionResult> UpdateJobStatus(string jobId, string userId, string status)
        {
            try
            {
                var res = new JobService().UpdateJobStatus(jobId, userId, status);
                return Ok(new ApiResult
                {
                    Data = res.ResultCount,
                    IsSuccess = res.IsSuccess
                });
            }
            catch (Exception ex)
            {
                return Ok(new ApiResult
                {
                    Data = null,
                    IsSuccess = false,
                    Message = ex.Message
                });
            }
        }
    }
}
