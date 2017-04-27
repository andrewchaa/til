* Install Microsoft.AspNetCore.Cors
* update Startup

```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddCors();
    services.AddMvc();
}

public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
{
    loggerFactory.AddConsole(Configuration.GetSection("Logging"));
    loggerFactory.AddDebug();

    app.UseCors(b => b.AllowAnyHeader().AllowAnyOrigin());
    app.UseMvc();

    DocumentDbRepository<MonitoringLog>.Initialize();
}

```
