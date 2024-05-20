using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : ControllerBase
    {
        [HttpGet]
        [Route("getjobs")]
        public async Task<IActionResult> GetJobs(string userId, string? jobStatus, string? createdBy, string? filename, string? fromDate, string? toDate)
        {
            try {
                var jobs = new JobService().GetJob(userId, jobStatus, createdBy, filename, fromDate, toDate);
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
    }
}
