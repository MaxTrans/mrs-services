using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private IConfiguration _config;
        public UserController(IConfiguration config)
        {
            _config = config;
        }

        [HttpPost("SavePreferences")]
        public async Task<IActionResult> UserPreference([FromBody] PreferencesModal preferencesModal)
        {
            ApiResult result = new ApiResult();
            try
            {
                UserService userService = new UserService();
                var output = userService.SavePreferences(preferencesModal.UserId, preferencesModal.Website, preferencesModal.DefaultTat, preferencesModal.IsPdfAllowed, preferencesModal.IsDocAllowed);
                result.Data = output;
                result.IsSuccess = true;
                result.Message = "Preferences saved successfully";
                return Ok(result);
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Bad Request";
                return BadRequest(result);
            }
                
            
        }
    }
}
