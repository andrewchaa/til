# Share common code in ClassFixture

You can put common code to share in ClassFixture class

```csharp
public class UnitTestHostFixture
{
    public string ConnectionStringKey { get; }
    public ILogger Logger { get; }
    public IHost Host { get; }
    public Mock<IResolverHelperService> ResolverHelperService { get; }
    public Mock<ICompanyRepository> CompanyReporitory { get; }
    public IConfigurationRoot Configuration { get; }
    public string SubscriptionKeyHeader { get; }

    public UnitTestHostFixture()
    {
        SubscriptionKeyHeader = "Ocp-Apim-Subscription-Key";
        var inMemorySettings = new Dictionary<string, string> {
            {"SubscriptionKeyHeader", SubscriptionKeyHeader},
            {"ConnectionStringKey", ConnectionStringKey},
            {"ConnectionStrings:DefaultConnection", "TestConnection"},
        };
        Configuration = new ConfigurationBuilder()
            .AddInMemoryCollection(inMemorySettings)
            .Build();

        ResolverHelperService = new Mock<IResolverHelperService>();
        CompanyReporitory = new Mock<ICompanyRepository>();

        var startup = new Startup();
        Host = new HostBuilder()
            .ConfigureWebJobs(startup.Configure)
            .ConfigureServices(x =>
            {
                x.Replace(new ServiceDescriptor(typeof(IConfiguration), Configuration));
                x.Replace(new ServiceDescriptor(typeof(IResolverHelperService), ResolverHelperService.Object));
                x.Replace(new ServiceDescriptor(typeof(ICompanyRepository), CompanyReporitory.Object));
            })
            .Build();

        Logger = new Mock<ILogger>().Object;

    }
}
```

```csharp
public class SearchOnboardedCompaniesFunctionTests : IClassFixture<UnitTestHostFixture>
{
    private readonly UnitTestHostFixture _fixture;

    public SearchOnboardedCompaniesFunctionTests(UnitTestHostFixture fixture)
    {
        _fixture = fixture;
    }

```
