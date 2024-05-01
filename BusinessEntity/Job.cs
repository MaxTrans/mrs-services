using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
    public class Job
    {
        public string Id { get; set; }
        public int JobId { get; set; }
        public string Name { get; set; }
        public string Priority { get; set; }
        public string Notes { get; set; }
        public bool IsSingleJob { get; set; }
        public string ParentJobId { get; set; }
        public string AssignTo { get; set; }
        public string L1User { get; set; }
        public string L2User { get; set; }
        public string L3User { get; set; }
        public string Status { get; set; }
        public string StatusName { get; set; }
        public bool IsDeleted { get; set; }
        public string CompanyId { get; set; }
        public string CreatedBy { get; set; }
        public string ModifyedBy { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime ModifiedDateTime { get; set; }

        public string JobFiles { get; set; }
        public string UserName { get; set; }
        public int UnReadMessages { get; set; }
        public string FilePreference { get; set; }
    }
}
