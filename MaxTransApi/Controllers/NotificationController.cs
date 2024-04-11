using BusinessEntity;
using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationController : ControllerBase
    {
        [HttpGet]
        [Route("getnotifications")]
        public async Task<IActionResult> GetNotifications(string jobId)
        {
            try
            {
                var notifications = new NotificationService().GetNotifications(jobId);
                return Ok(new ApiResult
                {
                    Data = notifications,
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

        [HttpPost]
        [Route("savenotification")]
        public async Task<IActionResult> SaveNotification(Notification notification)
        {
            try
            {
                var notifications = new NotificationService().SaveNotification(notification);
                return Ok(new ApiResult
                {
                    Data = notifications,
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
