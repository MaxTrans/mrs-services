using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
    public class Client
    {
        public string Id { get; set; }
        public string UserId { get; set; }
        public string ClientType { get; set; }
        public string ClientName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string LoginName { get; set; }
        public string Password { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string RoleName { get; set; }
        public string CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string Details { get; set; }
        public string Website { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public int StateId { get; set; }
        public int CountryId { get; set; }
        public int DefaultTAT { get; set; }
        public bool FilePreferencePDF { get; set; }
        public bool FilePreferenceWord { get; set; }
        public bool FilePreferencePDFLink { get; set; }
        public string ClientLogo { get; set; }
        public bool IsDeleted { get; set; }
        public string CreatedBy { get; set; }
        public string ModifyedBy { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime ModifiedDateTime { get; set; }
        public string FilePreference { get; set; }
    }
}
