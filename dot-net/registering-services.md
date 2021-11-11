# Registering services in .NET

Use `services`

* `AddSingle`: register the service as singleton dependency

```csharp
services.AddSingleton(x => new ServiceBusClient(
    x.GetService<IConfiguration>().GetConnectionString("broker")));
```

```csharp
public static IServiceProvider BuildServices()
{
    var services = new ServiceCollection();

    var componentName = Environment.GetEnvironmentVariable(EnvVariables.ComponentName);
    var configuration = new ConfigurationBuilder()
        .AddEnvironmentVariables()
        .AddSystemsManager($"/{componentName}", true, TimeSpan.FromMinutes(5))
        .Build();
    services.AddSingleton<IConfiguration>(configuration);

    var emailSender = new EmailSender(configuration[EnvVariables.SenderAddress], receiverAddresses, Log.Logger);
    services.AddSingleton<INotificationSender>(x => new AggregateNotificationSender(emailSender));

    return services.BuildServiceProvider();
}

```
