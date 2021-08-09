# IConfiguration in Unit Test

You can use an actual Configuration instance with in-memory data.

```csharp

var inMemorySettings = new Dictionary<string, string> {
    {"TopLevelKey", "TopLevelValue"},
    {"SectionName:SomeKey", "SectionValue"},
    //...populate as needed for the test
};

IConfiguration configuration = new ConfigurationBuilder()
    .AddInMemoryCollection(inMemorySettings)
    .Build();

```
