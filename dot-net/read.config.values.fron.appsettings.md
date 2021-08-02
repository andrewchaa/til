# Read configuration values from AppSettings.json

Install

* Microsoft.Extensions.Configuration

Use ConfigurationBuilder

```csharp
var releaseEnvironment = Environment.GetEnvironmentVariable(ReleaseEnvironmentName);
TestEnvironment = string.IsNullOrEmpty(releaseEnvironment)
    ? "local"
    : releaseEnvironment.Replace("stage-", string.Empty);
var config = new ConfigurationBuilder()
    .AddJsonFile($"appsettings.{TestEnvironment}.json")
    .Build();

SubcriptionKeyHeader = "Ocp-Apim-Subscription-Key";
_subscriptionKey = config["subscript_key"];
var apiHost = config["api_host"];
var apiProduct = config["product"];
```
