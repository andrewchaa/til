# Getting started with Snapshooter

https://swisslife-oss.github.io/snapshooter/docs/get-started

```csharp
[Fact]
public void CreatePersonSnapshotTest()
{
    // arrange
    var serviceClient = new ServiceClient();

    // act
    TestPerson person = serviceClient.CreatePerson(
        Guid.Parse("2292F21C-8501-4771-A070-C79C7C7EF451"), "David", "Mustermann");

    // assert
    Snapshot.Match(person);
}
```

## Match

Match an only element

```csharp
Snapshot.Match(ApiResponseBody, matchOptions => matchOptions
    .IgnoreFields("*")
    .Assert(x => 
        Assert.Equal(orderId, x.GetAllFieldsByName<string>("id").First())));
```
