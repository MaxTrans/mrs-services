using System.IdentityModel.Tokens.Jwt;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.IdentityModel.Tokens;

namespace MaxTransApi
{
    public class TokenValidationMiddleware : IMiddleware
    {
        private readonly IConfiguration _config;

        public TokenValidationMiddleware(IConfiguration config)
        {
             _config = config;
        }
        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            var token = context.Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
            string validationMessage = string.Empty;
            // Validate the token (e.g., using JwtSecurityTokenHandler)
            // Add your custom validation logic here

            if (IsValidToken(token, out validationMessage) || (context.Request.Path.Value != null && context.Request.Path.Value.Contains("verifylogin")))
            {
                await next(context); // Continue with the request
            }
            else
            {
                context.Response.StatusCode = StatusCodes.Status401Unauthorized;
                await context.Response.WriteAsync(validationMessage);
            }
        }

        private bool IsValidToken(string token,out string result)
        {
            // Implement your token validation logic (e.g., using JwtSecurityTokenHandler)
            // Return true if the token is valid; otherwise, return false
            // Example: check expiration, issuer, audience, etc.
            // Validate the token (e.g., using JwtSecurityTokenHandler)
            result = string.Empty;
            var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["JWT:Secret"]));
            var handler = new JwtSecurityTokenHandler();
            var validationParameters = new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidateIssuerSigningKey = true,
                ValidIssuer = _config["JWT:ValidIssuer"],
                ValidAudience = _config["JWT:ValidAudience"],
                IssuerSigningKey = authSigningKey,
            };

            try
            {
                var claimsPrincipal = handler.ValidateToken(token, validationParameters, out _);
                // Token is valid; proceed with your logic
            }
            catch (Exception ex)
            {
                result = ex.Message;
                // Token validation failed; return unauthorized response
                return false;
            }

            return true; // Placeholder; replace with actual validation
        }
    }
}
