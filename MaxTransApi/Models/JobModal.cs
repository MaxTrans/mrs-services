namespace MaxTransApi.Models
{
    public class JobModal
    {
        public UploadFileModal[] UploadFiles { get; set; }
        public bool UploadType { get; set; }
        public string Tat { get; set; }
        public string Comment { get; set; }
        public string CreatedBy { get; set; }
        public string CompanyId { get; set; }
        public string MergeFilename { get; set; }
    }

    public class AdminFileUpload
    {
        public string JobId { get; set; }
        public UploadFileModal[] UploadFiles { get; set; }
        public string CreatedBy { get; set; }
       
    }

    public class UploadFileModal
    {
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public string FileExtension { get; set; }
        public int Size { get; set; }
        public string FileId { get; set; }
        public int PageCount { get; set; }  

    }
}
