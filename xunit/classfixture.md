# Share common code in ClassFixture

You can put common code to share in ClassFixture class

```csharp
public class IntegrationTestFixture
{
    private string _subscriptionKey;
    const string ReleaseEnvironmentname = "RELEASE_ENVIRONMENTNAME";

    public string ApiHost { get; }   
    public string ApiProduct { get; }
    public int MaxRetry = 15;
    public string TestEnvironment
    {
        get
        {
            var releaseEnvironment = Environment.GetEnvironmentVariable(ReleaseEnvironmentname);
            return string.IsNullOrEmpty(releaseEnvironment)
                ? "local"
                : releaseEnvironment.Replace("stage-", string.Empty);
        }
    }

    public IntegrationTestFixture()
    {
        var config = new ConfigurationBuilder()
            .AddJsonFile($"appsettings.{TestEnvironment}.json")
            .Build();

        _subscriptionKey = config["subscript_key"];
        ApiHost = config["api_host"];
        ApiProduct = config["product"];
    }

    public HttpClient GetClient(ITestOutputHelper output)
    {
        DelegatingHandler logHandler = new RequestLogHandler(output);
        var client = HttpClientFactory.Create(new [] {logHandler});
        client.DefaultRequestHeaders.Add(Apim.SubcriptionKeyHeader, _subscriptionKey);


        return client;
    }
}
```

```csharp
public class OnboardCompanyV2Tests : IClassFixture<IntegrationTestFixture>
{
    private readonly IntegrationTestFixture _fixture;
    private readonly ITestOutputHelper _output;
    private readonly Uri _companyUri;
    private readonly HttpClient _client;

    public OnboardCompanyV2Tests(IntegrationTestFixture fixture, ITestOutputHelper output)
    {
        _fixture = fixture;
        _output = output;
        _companyUri = new Uri($"{_fixture.ApiHost}/{_fixture.ApiProduct}/v2/Companies");
        _client = _fixture.GetClient(output);

        _output.WriteLine($"targetUrl: {_companyUri}");
    }

```
