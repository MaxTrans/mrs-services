using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LookupController : ControllerBase
    {
        [HttpGet]
        [Route("getuserlookup")]
        public async Task<IActionResult> GetUserLookUp(string role)
        {
            try
            {
                var jobs = new LookupService().GetUsers(role);
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
        [Route("getstatuslookup")]
        public async Task<IActionResult> GetStatusLookUp(string type)
        {
            try
            {
                var statusList = new LookupService().GetStatus(type);
                return Ok(new ApiResult
                {
                    Data = statusList,
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
