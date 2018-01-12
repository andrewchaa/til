### Creating a project

    // Web Api
    mkdir coiny
    cd coiny
    dotnet new webapi
    dotnet run

    // MVC + WebApi
    mkdir coiny
    cd coiny
    dotnet new razor
    dotnet run

### Configuration

    // options
    var options = new OptionsWrapper<ZendeskOptions>(new ZendeskOptions
    {
        EndpointUri = appSettings.GetValue("zendeskurl"),
        Token = appSettings.GetValue("zendesktoken"),
        Username = appSettings.GetValue("zendeskuser")
    });

### Start up

    public Startup(IHostingEnvironment env)
    {
        env.ConfigureNLog("nlog.config"); // read nlog config
    }


    public void ConfigureServices(IServiceCollection services)
    {
        services.AddCors();  // adding CORSs upport. install Microsoft.AspNetCore.Cors
        services.AddMvc(config =>
        {
            var policy = new AuthorizationPolicyBuilder()   // add global auth filter
                .RequireAuthenticatedUser()
                .Build();
            config.Filters.Add(new AuthorizeFilter(policy));
        });
    
        
        services.AddTransient<IApiClient, GdaxClient>(); // IoC set up

    }

    public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
    {
        loggerFactory.AddNLog();    // nlog support
        loggerFactory.AddConsole(Configuration.GetSection("Logging")); // nlog console logger
        loggerFactory.AddDebug();

        app.UseCors(b => b.AllowAnyHeader().AllowAnyOrigin()); // CORS
        app.UseMvc();

        DocumentDbRepository<MonitoringLog>.Initialize();
    }
    
    // Adding a global authorization filter


    // nlog config

    <?xml version="1.0" encoding="utf-8"?>
    <nlog xmlns="http://www.nlog-project.org/schemas/NLog.xsd"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          autoReload="true"
          internalLogLevel="Warn"
          internalLogFile="c:\temp\internal-nlog.txt">

      <!-- Load the ASP.NET Core plugin -->
      <extensions>
        <add assembly="NLog.Web.AspNetCore"/>
      </extensions>

      <!-- the targets to write to -->
      <targets>
        <!-- write logs to file -->
    <!--    <target xsi:type="File" name="allfile" fileName="c:\temp\nlog-all-${shortdate}.log"-->
    <!--            layout="${longdate}|${event-properties:item=EventId.Id}|${logger}|${uppercase:${level}}|${message} ${exception}" />-->

        <target xsi:type="Console" name="con" layout="${longdate}|${event-properties:item=EventId.Id}|${logger}|${uppercase:${level}}|${message} ${exception}" />

        <!-- another file log, only own logs. Uses some ASP.NET core renderers -->
        <target xsi:type="File" name="ownFile-web" fileName="c:\logs\trenbe.regionalproxy-${shortdate}.log"
                layout="${longdate}|${event-properties:item=EventId.Id}|${logger}|${uppercase:${level}}|  ${message} ${exception}|url: ${aspnet-request-url}|action: ${aspnet-mvc-action}" />

        <!-- write to the void aka just remove -->
        <target xsi:type="Null" name="blackhole" />
      </targets>

      <!-- rules to map from logger name to target -->
      <rules>
        <!--All logs, including from Microsoft-->
        <logger name="*" minlevel="Trace" writeTo="con" />
        <logger name="*" minlevel="Trace" writeTo="ownFile-web" />
      </rules>
    </nlog>





### Controllers

    // download file
    var fileStream = Encoding.ASCII.GetBytes(sb.ToString());
    return File(fileStream, "text/css", $"{name}-eur.csv");

