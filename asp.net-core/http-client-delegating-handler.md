# HttpClient DelegatingHandler

I wanted to log the request header and the body in my integration test run. So that I can send the same request from my Postman, if the test fails.

```csharp
public class RequestLogHandler : DelegatingHandler
{
    private readonly ITestOutputHelper _output;

    public RequestLogHandler(ITestOutputHelper output)
    {
        _output = output;
    }

    protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, 
        CancellationToken cancellationToken)
    {
        var response = await base.SendAsync(request, cancellationToken);
        _output.WriteLine(JsonConvert.SerializeObject(new { request.Headers }));

        if (request.Content != null)
        {
            _output.WriteLine(JsonConvert.SerializeObject(
                new { Content = await request.Content.ReadAsStringAsync()}));    
        }
        return response;
    }
}

// fixture class
public HttpClient GetClient(ITestOutputHelper output)
{
    DelegatingHandler logHandler = new RequestLogHandler(output);
    var client = HttpClientFactory.Create(new [] {logHandler});
    client.DefaultRequestHeaders.Add(Apim.SubcriptionKeyHeader, _subscriptionKey);


    return client;
}


```
