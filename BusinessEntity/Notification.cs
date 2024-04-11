using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
    public class Notification
    {
        public string? Id { get; set; }
        public string? JobId { get; set; }
        public string? Comments { get; set; }
        public bool? IsReadMessage { get; set; }
        public string? CreatedByName { get; set; }
        public DateTime? CreatedDateTime { get; set; }
        public string? UserId { get; set; }
    }
}
