# xUnit

* [skip test](#skip-test)
* [write output](#write-output)

### skip test

```csharp
[Fact (Skip = "To have a proper end-to-end tests")]
public async Task Should_handle_the_publishing_message()
{
    var scheduledEvent = ScheduledEvent.Create(Tenant.Uk,
```

### write-output

```csharp
public LocalFunctionTests(ITestOutputHelper output)
{
    _output = output;
}

_output.WriteLine($"Elapsed: {watch.ElapsedTicks}");
```

Do `dotnet test source/*.IntegrationTests/ --logger "console;verbosity=detailed"` to output the log to the console

### parameterised tests

```csharp
[Theory]
[InlineData(true, LegacyTempOfflineType.ClosedToday)]
[InlineData(true, LegacyTempOfflineType.TempOffline)]
[InlineData(true, LegacyTempOfflineType.ClosedDueToEvent)]
[InlineData(true, LegacyTempOfflineType.IgnoredOrders)]
[InlineData(false, LegacyTempOfflineType.FailedJctConnection)]
[InlineData(false, LegacyTempOfflineType.NoTrOverride)]
public async Task Should_set_the_given_LegacyTempOfflineType(bool allowRestaurantOverride, LegacyTempOfflineType tempOfflineType)
{
    //act
    await _handler.Handle(new CreateRestaurantEventCommand(TestTenant,
        Name,
        Reason,
        _startDate.DateTime.ToIsoMicroseconds(),
        F.None,
        _endDate,
        _filter,
        allowRestaurantOverride,
        _userRole,
        _requester,
        F.Some(tempOfflineType.ToString())),
        new CancellationToken());

    //assert
    _repository.Verify(r => r.Save(It.Is<RestaurantEvent>(e => e.LegacyTempOfflineType == tempOfflineType)));
}

```
