# Unit-testing C# Azure Function

As Function is a slimmer package than ASP.NET Core, it requires a few manual setups to test function HTTP endpoint.

Populating values in IConfiguration

```csharp
var inMemorySettings = new Dictionary<string, string> {
    {"HeyHeader", keyHeader},
    {"ConnectionStrings:DefaultConnection", "TestConnection"},
};

var configuration = new ConfigurationBuilder()
    .AddInMemoryCollection(inMemorySettings)
    .Build();
```

Replacing dependencies with mocked objects

```csharp
var startup = new Startup();
var host = new HostBuilder()
    .ConfigureWebJobs(startup.Configure)
    .ConfigureServices(x =>
        {
            x.Replace(new ServiceDescriptor(typeof(IConfiguration), configuration));
            x.Replace(new ServiceDescriptor(typeof(IResolverHelperService), resolverHelperService.Object));
        })
    .Build();
```


```csharp
public class SearchOnboardedCompaniesFunctionTests
{
    [Fact]
    public async Task ShouldReturn422UnprocessableEntityIfTheConnectionStringIsNotFound()
    {
        // arrange
        var inMemorySettings = new Dictionary<string, string> {
            {"HeyHeader", keyHeader},
            {"ConnectionStrings:DefaultConnection", "TestConnection"},
        };

        var configuration = new ConfigurationBuilder()
            .AddInMemoryCollection(inMemorySettings)
            .Build();

        var resolverHelperService = new Mock<IResolverHelperService>();
        resolverHelperService.Setup(x =>
                x.GetSubscriptionKeyFromHttpHeaders(It.IsAny<IHeaderDictionary>()))
            .Returns(string.Empty);

        var startup = new Startup();
        var host = new HostBuilder()
            .ConfigureWebJobs(startup.Configure)
            .ConfigureServices(x =>
                {
                    x.Replace(new ServiceDescriptor(typeof(IConfiguration), configuration));
                    x.Replace(new ServiceDescriptor(typeof(IResolverHelperService), resolverHelperService.Object));
                })
            .Build();

        var req = new DefaultHttpContext().Request;
        req.Headers.Add(subscriptionKeyHeader, "TestSubscription");

        var function = new SearchOnboardedCompaniesFunction(
            host.Services.GetService<IConfiguration>(),
            host.Services.GetService<IResolverHelperService>(),
            );
        var logger = new Mock<ILogger>().Object;

        // action
        var response = await function.RunAsync(req, logger);

        // assert
        Assert.IsType<UnprocessableEntityObjectResult>(response);
    }
}

```
