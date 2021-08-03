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
var config = new ConfigurationBuilder()
    .AddJsonFile($"appsettings.{TestEnvironment}.json")
    .Build();

var apiHost = config["api_host"];
var apiProduct = config["product"];
```
