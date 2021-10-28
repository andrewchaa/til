# Mock4Net WireMock 

https://github.com/alexvictoor/mock4net

> A tiny mock http server for dotnet, inspired by wiremock from the Java landscape

### examples

```csharp
MockServer
    .Given(
        Request.Create()
            .WithUrl(ApiBaseUrl)
            .WithBody( body => body.Contains(designId))
            .WithHeader("auth-key", ApiKey)
            .WithHeader("authorization", CustomerBearerToken)
            .UsingPost())
    .WithTitle("GivenACustomerDesignIsAvailable")
    .RespondWith(
        Response.Create()
            .WithStatusCode(200)
            .WithBodyFromFile("./TestData/ApiFetchDesignById.json")
    );
```
