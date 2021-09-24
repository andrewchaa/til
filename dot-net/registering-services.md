# Registering services in .NET

Use `services`

* `AddSingle`: register the service as singleton dependency

```csharp
services.AddSingleton(x => new ServiceBusClient(
    x.GetService<IConfiguration>().GetConnectionString("broker")));
```
