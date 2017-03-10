## Adding a global authorization filter

```csharp
services.AddMvc(config =>
    {
        var policy = new AuthorizationPolicyBuilder()
            .RequireAuthenticatedUser()
            .Build();
        config.Filters.Add(new AuthorizeFilter(policy));
    })
    .AddApplicationPart(Assembly.Load(MicroserviceBuilder.ServiceName))
    .AddControllersAsServices()
    .AddJsonOptions(options =>
    {
        options.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
    });

```
