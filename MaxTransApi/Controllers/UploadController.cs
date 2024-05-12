using BusinessEntity;
using DataAccess;
using MaxTransApi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Xml;
using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using iText.Kernel.Pdf;


namespace MaxTransApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private IConfiguration _config;
        public UploadController(IConfiguration config)
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

        [HttpPost("SaveJob")]
        public IActionResult SaveJob([FromBody] JobModal job)
        {
            ApiResult result = new ApiResult();
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("FileName");
                dt.Columns.Add("FileExtension");
                dt.Columns.Add("SourceFilePath");
                dt.Columns.Add("CreatedBy");
                dt.Columns.Add("FileId");
                dt.Columns.Add("PageCount");

                foreach (var jobFile in job.UploadFiles)
                {
                    FileInfo fileInfo = new FileInfo(jobFile.FileName);
                    var dr = dt.NewRow();
                    dr["FileName"] = jobFile.FileName;
                    dr["FileExtension"] = jobFile.FileExtension;
                    dr["FileId"] = jobFile.FileId;
                    dr["SourceFilePath"] = jobFile.FilePath;
                    dr["CreatedBy"] = job.CreatedBy;

                    dt.Rows.Add(dr);
                }


                var output = new UploadService().SaveJob(dt, job.MergeFilename, job.Tat, job.Comment, job.UploadType, job.CompanyId, job.CreatedBy);
                result.Data = output;
                result.IsSuccess = true;
                GetPageCountForUploadFiles(job.UploadFiles);
                return Ok(result);
            }
            catch (Exception ex)
            {
                result.Data = $"{ex.Message}  Stack Trace: {ex.StackTrace}";
                result.IsSuccess = false;
                return BadRequest(result);
            }
        }

        [HttpPost("AdminFileUpload")]
        public IActionResult UploadFile([FromBody] AdminFileUpload fileUpload)
        {
            ApiResult result = new ApiResult();
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("FileName");
                dt.Columns.Add("FileExtension");
                dt.Columns.Add("SourceFilePath");
                dt.Columns.Add("CreatedBy");
                dt.Columns.Add("FileId");
                

                foreach (var jobFile in fileUpload.UploadFiles)
                {
                    FileInfo fileInfo = new FileInfo(jobFile.FileName);

                    var dr = dt.NewRow();
                    dr["FileName"] = jobFile.FileName;
                    dr["FileExtension"] = jobFile.FileExtension;
                    dr["SourceFilePath"] = jobFile.FilePath;
                    dr["CreatedBy"] = fileUpload.CreatedBy;
                    dr["FileId"] = jobFile.FileId.Trim();
                  
                    dt.Rows.Add(dr);
                }

                var output = new UploadService().SaveAdminFileUpload(dt, fileUpload.JobId, fileUpload.CreatedBy);
                result.Data = output;
                result.IsSuccess = true;
                GetPageCountForUploadFiles(fileUpload.UploadFiles);
                return Ok(result);
            }
            catch (Exception ex)
            {
                result.Data = $"{ex.Message}  Stack Trace: {ex.StackTrace}";
                result.IsSuccess = false;
                return BadRequest(result);
            }
        }

        private void GetPageCountForUploadFiles(UploadFileModal[] uploadFiles)
        {
            Task? longRunningTask = null;
            StringBuilder sb = new StringBuilder();
            sb.Append("<Files>");
            try
            {
                longRunningTask = Task.Run(() =>
                 {
                     for (int i = 0; i < uploadFiles.Length; i++)
                     {
                         var file = uploadFiles[i];
                         var fileInfo = new FileInfo(file.FileName);
                         if (fileInfo.Extension == ".pdf")
                         {
                             using (var pdfReader = new PdfReader(file.FilePath))
                             {
                                 using (PdfDocument pdfDocument = new PdfDocument(pdfReader))
                                 {
                                     int pageCount = pdfDocument.GetNumberOfPages();
                                     sb.AppendLine($"<FileInfo id=\"{file.FileId}\" pageCount=\"{pageCount}\" />");
                                 }
                             }
                         }
                     }
                     sb.AppendLine("</Files>");
                     var output = new UploadService().UpdatePageCount(sb.ToString());

                 });

                longRunningTask.Start();
            }
            catch (Exception ex)
            {
            }
            finally {
                if (longRunningTask != null && longRunningTask.IsCompleted)
                    longRunningTask.Dispose();
            }
        }

        
    }
}
