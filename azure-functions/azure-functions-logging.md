# Azure Functions Logging

Resources

* https://docs.microsoft.com/en-us/azure/azure-functions/configure-monitoring?tabs=v2

Set up logging in `host.json`

```json
"logging": {
  "fileLoggingMode": "always",
  "logLevel": {
    "default": "Information",
    "Host.Results": "Error",
    "Function": "Error",
    "Host.Aggregator": "Trace"
  },
  "applicationInsights": {
    "samplingExcludedTypes": "Request",
    "samplingSettings": {
      "isEnabled": true,
      "maxTelemetryItemsPerSecond" : 20,
      "excludedTypes": "Request;Exception"
    }
  }
}

```

In function

```csharp
public async Task<IActionResult> RunAsync(
    [HttpTrigger(AuthorizationLevel.Function, "get", Route = "v2/companies")]
    HttpRequest request, 
    ILogger log)
    
    log.LogInformation(
        "Searching companies by startEntityId: {startEntityId}, " +
                "name: {CompanyName}, " + 
                "companyNumber: {CompanyNumber}, " + 
                "countryCode: {CountryCode}, " + 
                "externalUid: {ExternalUid}, " + 
                "tenant: {TenantName} {TenantId} " + 
                "from: {dateFrom}, to: {dateTo}",
        startEntityId,
        companyName.ToString(), 
        companyNumber.ToString(),
        countryCode.ToString(),
        externalUid.ToString(),
        tenantId,
        tenantName,
        dateFrom,
        dateTo
        );
    
```

In support classes, 

```csharp
public CompanyRepository(IEntityRepository entityRepository, 
    ILogger<CompanyRepository> logger)
{
    _entityRepository = entityRepository;
    _logger = logger;
}

_logger.LogInformation(companies.First().Serialize());
```
