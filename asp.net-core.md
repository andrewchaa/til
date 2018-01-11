### Setting up Web Api

    mkdir coiny
    cd coiny
    dotnet new webapi
    
    dotnet run

### Configuration

    // options
    var options = new OptionsWrapper<ZendeskOptions>(new ZendeskOptions
    {
        EndpointUri = appSettings.GetValue("zendeskurl"),
        Token = appSettings.GetValue("zendesktoken"),
        Username = appSettings.GetValue("zendeskuser")
    });

    // cors
    // Install Microsoft.AspNetCore.Cors
    // update Startup

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




### Controllers

    // download file
    var fileStream = Encoding.ASCII.GetBytes(csvString);
    return File(fileStream, "text/csv");

