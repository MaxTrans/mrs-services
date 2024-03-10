using Microsoft.OpenApi.Models;
using System.Text;

namespace MaxTransApi
{
    //public class Startup
    //{
    //    public Startup(IConfiguration configuration)
    //    {
    //        Configuration = configuration;
    //    }

    //    public IConfiguration Configuration { get; }

    //    // This method gets called by the runtime. Use this method to add services to the container.
    //    public void ConfigureServices(IServiceCollection services)
    //    {
    //        services.AddControllers();
    //        services.AddEndpointsApiExplorer();
    //        services.AddSwaggerGen(options =>
    //        {
    //            options.SwaggerDoc("v1", //this v was in caps earlier
    //            new OpenApiInfo
    //            {
    //                Version = "v1",//this v was in caps earlier
    //                Title = "MRC",
    //                Description = "A simple and easy blog which anyone love to blog."
    //            });
    //        });
    //        services.AddControllers().AddNewtonsoftJson();
    //        services.AddCors();
    //        services.AddControllers().AddXmlSerializerFormatters();

    //        //services.AddSingleton<IRefreshTokenGenerator>(provider => new RefreshTokenGenerator());

    //        // configure strongly typed settings objects
    //        var appSettingsSection = Configuration.GetSection("AppSettings");
    //        services.Configure<AppSettings>(appSettingsSection);

    //        var _jwtsetting = Configuration.GetSection("JWTSetting");
    //        services.Configure<JWTSetting>(_jwtsetting);

    //        // configure jwt authentication
    //        var appSettings = appSettingsSection.Get<AppSettings>();
    //        var key = Encoding.ASCII.GetBytes(appSettings.Secret);
    //        var authkey = Configuration.GetValue<string>("JWTSetting:securitykey");

    //        services.AddAuthentication(x =>
    //        {
    //            x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    //            x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    //        })
    //        .AddJwtBearer(x =>
    //        {
    //            x.RequireHttpsMetadata = false;
    //            x.SaveToken = true;
    //            x.TokenValidationParameters = new TokenValidationParameters
    //            {
    //                ValidateIssuerSigningKey = true,
    //                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(authkey)),
    //                ValidateIssuer = false,
    //                ValidateAudience = false
    //            };
    //        });

    //        // configure DI for application services
    //        services.AddScoped<IUserService, UserService>();
    //        services.AddScoped<IRefreshTokenGenerator, RefreshTokenGenerator>();
    //        // services.AddScoped<ICommonDL, CommonDL>();
    //    }

    //    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    //    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    //    {
    //        app.UseRouting();

    //        // global cors policy
    //        app.UseCors(x => x
    //            .AllowAnyOrigin()
    //            .AllowAnyMethod()
    //            .AllowAnyHeader());
    //        app.UseSwagger();
    //        app.UseSwaggerUI(options =>
    //        {
    //            options.SwaggerEndpoint("v1/swagger.json", "MRC");
    //        });

    //        app.UseAuthentication();
    //        app.UseAuthorization();

    //        app.UseEndpoints(endpoints =>
    //        {
    //            endpoints.MapControllers();
    //        });
    //    }
    //}
}
