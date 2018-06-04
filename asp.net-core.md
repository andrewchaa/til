# ASP.NET Core 

## Table of Contents

1. [Resources](#resources)
1. [Running xunit tests](#runningxunittests)


## Contents

**<a href="#runningxunittests">Runing xUnit Tests</a>**

Install packages

* Microsoft.NET.Test.Sdk
* xunit
* xunit.runner.visualstudio

The target framework should be .NETCore 2.0 more or less, not .NETStandard 2.0

**<a href="#resources">Resources</a>**

* [Enabling swagger](https://docs.microsoft.com/en-us/aspnet/core/tutorials/web-api-help-pages-using-swagger?tabs=visual-studio) 
* [Writing middleware](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/middleware/?tabs=aspnetcore2x)
* [Improved Model Bindings](https://www.red-gate.com/simple-talk/dotnet/asp-net/improved-model-binding-asp-net-core/)

### Command line tool

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
    
    // watch
    dotnet watch run -p JustExpense.fsproj

## Set up

```csharp

// get url
public TenantContext(IHttpContextAccessor accessor, ILogger<TenantContext> logger)
{
    _accessor = accessor;
    _logger = logger;
}

public Tenant GetTenant()
{
    var tenant = _accessor.HttpContext.Request.Path.ToString().Split("/")[2];

    _logger.LogInformation($"Tenant: {tenant}");
    return tenant.To<Tenant>();
}


// options
var options = new OptionsWrapper<ZendeskOptions>(new ZendeskOptions
{
    EndpointUri = appSettings.GetValue("zendeskurl"),
    Token = appSettings.GetValue("zendesktoken"),
    Username = appSettings.GetValue("zendeskuser")
});

```
### Start up

```csharp
// open kestrel outside other than localhost
// launchsettings.json
"JE.Restaurant.Events": {
  "commandName": "Project",
  "launchBrowser": true,
  "environmentVariables": {
    "ASPNETCORE_ENVIRONMENT": "Development"
  },
  "applicationUrl": "http://0.0.0.0:5000/"
}

```

    // read nlog config
    env.ConfigureNLog("nlog.config"); // read nlog config

    // add global filter
    services.AddMvc(config =>
    {
        var policy = new AuthorizationPolicyBuilder()
            .RequireAuthenticatedUser()
            .Build();
        config.Filters.Add(new AuthorizeFilter(policy));
    });

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



## Model Bindings
```csharp
    [HttpPost("events/[controller]")]
    public async Task<IActionResult> Post([FromRoute] Tenant tenant,
        [FromBody] OfflineRequestModel request,
        [FromHeader(Name= "X-JE-User-Role")] string userRole,
        [FromHeader(Name= "X-JE-Requester")] string requester)
        {

```
## Testing

```csharp
// create options for testing
_options = Options.Create(new AppSettings());
    
```


### API Tests

    private readonly TestServer _server;
    private readonly HttpClient Client;
    private readonly Mock<IScheduledEventService> _service;
    private Mock<IScheduledEventRepository> _repository;
    private const string EventDescription = "Test Event Description";
    private const string EventName = "Test Event Name";
    private const string TestPostCodeValue = "EC4M";

    public CreatingScheduledEventTests()
    {
        _service = new Mock<IScheduledEventService>();
        _repository = new Mock<IScheduledEventRepository>();

        _server = new TestServer(new WebHostBuilder()
            .UseStartup<Startup>()
            .ConfigureServices(services =>
            {
                services.AddTransient<IScheduledEventService>(p => _service.Object);
                services.AddTransient<IScheduledEventRepository>(p => _repository.Object);
            }));

        Client = _server.CreateClient();

    }

    private CreateScheduledEventRequest BuildScheduledEventViewModel()
    {
        var viewModel = new CreateScheduledEventRequest
        {
            Name = EventName,
            Description = EventDescription,
            ActionTasks = new[]
            {
                new ActionTaskViewModel { Action = "Offline", Date = DateTime.Today },
                new ActionTaskViewModel { Action = "Online", Date = DateTime.Today.AddDays(1) }
            },
            Filter = new FilterViewModel { Type = "PostCode", Value = TestPostCodeValue },
        };


        return viewModel;
    }
    private string Uri { get; } = "/api/scheduledevents";

    [Fact]
    public async Task Should_Return_201_Created()
    {
        var response = await HttpClientExtensions.PostAsJsonAsync(Client, Uri, BuildScheduledEventViewModel());

        Assert.Equal(HttpStatusCode.Created, response.StatusCode);
    }

    [Fact]
    public async Task Should_Save_The_Events_Name_And_Description()
    {
        await HttpClientExtensions.PostAsJsonAsync(Client, Uri, BuildScheduledEventViewModel());

        _service.Verify(s => s.Create(It.Is<ScheduledEvent>(e => e.Name == EventName)));
        _service.Verify(s => s.Create(It.Is<ScheduledEvent>(e => e.Description == EventDescription)));
    }
