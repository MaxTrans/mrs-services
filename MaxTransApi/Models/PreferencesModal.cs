using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace MaxTransApi.Models
{
    public class PreferencesModal
    {
        public string Website { get; set; }
        public string DefaultTat { get; set; }
        public bool IsPdfAllowed { get; set; }
        public bool IsDocAllowed { get; set; }
        public string UserId { get; set; }

    }
}
