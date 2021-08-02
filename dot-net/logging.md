# Logging in .NET

Install packages

```
Microsoft.Extensions.DependencyInjection
Microsoft.Extensions.Logging
Microsoft.Extensions.Logging.Console
```

Register logging to the service provider

```csharp
return new ServiceCollection()
    .AddLogging(x => x
        .AddConsole())
    .Configure<LoggerFilterOptions>(x => x.MinLevel = LogLevel.Information)
    .BuildServiceProvider(false);

```
