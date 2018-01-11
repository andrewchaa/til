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

    // nlog
    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            env.ConfigureNLog("nlog.config");
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddNLog();
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            app.AddNLogWeb();
        }
    }
    
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
    var fileStream = Encoding.ASCII.GetBytes(csvString);
    return File(fileStream, "text/csv");

