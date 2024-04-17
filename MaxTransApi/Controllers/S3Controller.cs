using Microsoft.AspNetCore.Mvc;

namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class S3Controller : ControllerBase
    {
        [HttpPost]
        [Route("multipart")]
        public IActionResult Multipart([FromBody] UploadInfo fileInfo)
        {
            return Ok(fileInfo);
        }
    }

    public class UploadInfo
    {
        public string Filename { get; set; }
        public string Type { get; set; }
    }
}
