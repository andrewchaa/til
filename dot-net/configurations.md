# Configuration

### Read configuration values from AppSettings.json

Install

* Microsoft.Extensions.Configuration
* Microsoft.Extensions.Configuration.Json
* Microsoft.Extensions.Configuration.Binder
* Microsoft.Extensions.Configuration.EnvironmentVariables


Use ConfigurationBuilder

```csharp
var releaseEnvironment = Environment.GetEnvironmentVariable(ReleaseEnvironmentName);
TestEnvironment = string.IsNullOrEmpty(releaseEnvironment)
    ? "local"
    : releaseEnvironment.Replace("stage-", string.Empty);

var context = builder.GetContext();

var config = new ConfigurationBuilder()
    .SetBasePath(context.ApplicationRootPath)
    .AddJsonFile($"appsettings.{TestEnvironment}.json") // to read json file
    .AddEnvironmentVariables() // to read environment variables
    .Build();

var apiHost = config["api_host"];
var apiProduct = config["product"];
```

### IOptions pattern

```csharp
public class HandlerOptions
{
    [ConfigurationKeyName("MNPG_ENVIRONMENT_NAME")]
    public string EnvironmentName { get;set; } 

    [ConfigurationKeyName("component_name")]
    public string ComponentName  { get;set; }
}
`
```

```csharp
var configuration = new ConfigurationBuilder()
    .SetBasePath(context.ApplicationRootPath)
    .AddJsonFile($"appsettings.{TestEnvironment}.json") // to read json file
    .AddEnvironmentVariables()
    .Build();

var services = new ServiceCollection();
services.AddOptions();
services.Configure<HandlerOptions>(configuration);
```

```csharp
public FunctionHandler(INotificationSender emailSender, 
    IOptions<HandlerOptions> options)
{
    _emailSender = emailSender;
    _environment = options.Value.EnvironmentName;
}

```
