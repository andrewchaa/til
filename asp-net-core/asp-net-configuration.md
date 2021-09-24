# Configuration in ASP.NET

In ASP.NET Core, `IConfiguration` is set automatically. Just inject the inteerface into the constructor of your class.

```csharp
public WebhookController(ILogger<WebhookController> logger, 
    IConfiguration configuration)
{
    _logger = logger;
    _configuration = configuration;
}

private string GetSigningKey(string tenantId)
{
    var key = $"{tenantId.ToUpper()}_ClientKey";
    return _configuration.GetValue<string>(key) ?? string.Empty;
}

```
