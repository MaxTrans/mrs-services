using BusinessEntity;
using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        [HttpGet]
        [Route("getDashboardList")]
        public async Task<IActionResult> GetDashboardList(string userId, string role)
        {
            try
            {
                List<DashboardInfo> list = new List<DashboardInfo>();
                if (role == "Admin")
                {
                    list = new DashboardService().GetDashboardList(null);
                }
                else
                {
                    list = new DashboardService().GetDashboardList(userId);
                }
                
                return Ok(new ApiResult
                {
                    Data = list,
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
