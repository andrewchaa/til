# ASP.NET Core 

https://www.safaribooksonline.com/library/view/aspnet-core-mvc/9781785886751/

1. Installing or updating .NET Core
1. Managing NuGet packages in ASP.NET Core applications
1. Creating an ASP.NET Core MVC application
1. Creating and running an ASP.NET Core MVC application on Azure
1. Working with Roslyn
1. Working with npm, Frontend Package Managers, and Task Runners
1. Using and creating npm modules
1. Creating a node package
1. Publishing the package
1. Managing frontend dependencies with Bower
1. Compiling LESS files to CSS files with Grunt
1. Bundling and minifying JavaScript files with Gulp
1. Using Yeoman code-generated templates
1. Using JSPM
1. Reusing Code with NuGet
1. Managing NuGet packages
1. Creating a NuGet package with the NuGet package class library
1. Creating a local NuGet repository and consuming packages from it
1. Creating a NuGet package with NuGet Package Explorer
1. Sharing NuGet packages with the community
1. Creating an Azure NuGet repository
1. SOLID Principles, Inversion of Control, and Dependency Injection
1. SOLID principles
1. Inversion of control
1. Dependency injection (DI)
1. DI containers
1. Configuring a DI container
1. IOC versus service locator
1. Life cycles
1. Implementing DI with Native IOC in ASP.NET Core
1. Using the life cycles available in ASP.NET Core
1. Implementing DI with Autofac
1. Implementing DI with StructureMap
1. Implementing DI with DryIoc
1. Data Access - EF7 with Repository, SQL Server, and Stored Procedures
1. Entity Framework (EF) approach
1. Configuring the IOC life cycle for the repository pattern
1. Using EF with an existing database
1. Using an InMemory provider
1. Managing a long request batch
1. Using a stored procedure with EF
1. Writing an EF provider
1. Accessing data with Micro ORMs, NoSQL, and Azure
1. Micro ORMs
1. NoSQL
1. Accessing data with Dapper
1. Accessing data with OrmLite
1. Accessing data with MongoDb
1. Accessing data with Windows Azure storage tables
1. Accessing data with Azure storage Blobs
1. Accessing data with SQL Azure
1. Cache and Session - Distributed, Server, and Client
1. Using .NET Cache with MemoryCache
1. Caching HTML with Cache TagHelpers
1. Using ResponseCache attribute
1. Using Session
1. Using Redis as Cache on-Premises
1. Using Redis as a cache on Azure
1. Caching with HTML5 cache manifest
1. Caching with HTML5 localStorage and sessionStorage
1. MVC and Web API routing
1. The route order
1. Routing with ASP.NET Core
1. Creating a route using convention routing
1. Creating a route using attribute routing
1. Creating a custom route using IRouter
1. Creating a route constraint
1. Creating a domain route
1. Creating SEO-friendly routes
1. ASP.NET Core MVC
1. Injecting dependencies and configuring IoC for a controller
1. Using ActionResults
1. Creating and working with areas
1. Creating and using POCO controllers
1. Creating and using controllers with MediatR
1. Managing exceptions
1. Web API
1. Using ActionResult
1. Configuring content negotiation
1. Configuring cross-domain origin requests
1. Using Swagger
1. Testing Web API
1. Managing exceptions
1. Filters
1. aging authentication and authorization with policies, requirements, and filters
1. Authentication
1. Managing dependency injection with filters
1. Creating and using an action filter
1. Creating and using a result filter
1. Creating and using a resource filter
1. Creating and using an exception filter
1. Using a filter globally versus using a middleware
1. Views, Models, and ViewModels
1. Creating and using a ViewModel with AutoMapper
1. Understanding and using ModelBinding
1. Creating our own model binder
1. Understanding and using a value provider
1. Configuring and using validation
1. Razor and Views
1. Managing namespaces in views with ViewImports
1. Creating a strongly typed Partial view
1. Configuring view and area locations
1. Using dependency injection in views
1. Creating HTMLHelpers
1. TagHelpers and ViewComponents
1. Using Environment, Script, and Link TagHelpers
1. Using Form TagHelpers
1. Creating TagHelpers programmatically
1. Creating a reusable view component
1. Creating a view component/controller class
1. OWIN and Middleware
1. Understanding OWIN, Katana, and the new ASP.NET Core HTTP pipeline
1. OWIN - an abstraction for decoupling
1. Katana - the Microsoft OWIN implementation
1. A new OWIN implementation with ASP.NET Core
1. The ASP.NET Core pipeline
1. Middleware
1. HTTP modules and HTTP handlers
1. Using inline middleware code as anonymous methods - Use, Run, Map, and MapWhen
1. Creating a reusable middleware component
1. Migrating an HTTP handler to middleware
1. Migrating HTTP modules to middleware
1. Security
1. Authentication in the real world
1. Authentication sample
1. Authentication in ASP.NET, using cookie authentication
1. Authentication using authorization servers
1. Using Facebook as an authorization server
1. Using Google as an authorization server
1. Managing identity
1. Securing data with Hashing
1. Securing data with Encryption
1. Frontend Development
1. Advantages of using CDN
1. Writing clean JavaScript
1. RequireJS
1. Typescript
1. Writing and executing unit tests in JavaScript
1. Debugging JavaScript code in browsers
1. Deployment and Hosting
1. Deployment options
1. Hosting an ASP.NET Core web app on IIS
1. Hosting an ASP.NET Core web application on Kestrel
1. Hosting an ASP.NET Core web app on Azure
1. Deploying an ASP.NET Core web app to Azure with Visual Studio Code
1. Deploying an ASP.NET Core web app to Azure with Visual Studio Community Edition
1. Hosting an ASP.NET Core web app in Docker containers

## Resources

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
