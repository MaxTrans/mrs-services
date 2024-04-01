using BusinessEntity;
using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Xml;

namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IntakeController : ControllerBase
    {
        private IConfiguration _config;
        public IntakeController(IConfiguration config)
        {
            _config = config;
        }

        [HttpPost("Upload")]
        public async Task<IActionResult> UploadFile(IFormFileCollection fileupload)
        {
            ApiResult result = new ApiResult();
            if (fileupload.Count > 0)
            {
                var docfiles = new List<string>();
                foreach (IFormFile file in fileupload)
                {
                    FileInfo fi = new FileInfo(file.FileName);
                    string filepath = $"{_config["Upload:TempFolder"]}/{fi.Name.Replace(fi.Extension, string.Empty)}{fi.Extension}";
                    using (FileStream fs = System.IO.File.Create(filepath))
                    {
                        byte[] bytes = new byte[file.Length];
                        await file.CopyToAsync(fs);
                    }
                }
                result.IsSuccess = true;
                result.Message = "File(s) uploaded successfully";

            }
            else
            {
                result.IsSuccess = false;
                result.Message = "Bad Request";
            }
            return Ok(result);
        }



    }
}
