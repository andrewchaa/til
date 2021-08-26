# Handle Configurations

### Read configuration values from AppSettings.json

Install

* Microsoft.Extensions.Configuration
* Microsoft.Extensions.Configuration.Json

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
