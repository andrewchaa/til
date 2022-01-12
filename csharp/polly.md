# Polly

Handle exception

```csharp
// wait and try async
await Policy
    .Handle<Exception>()
    .WaitAndRetryAsync(new[]
    {
        TimeSpan.FromSeconds(1),
        TimeSpan.FromSeconds(2),
        TimeSpan.FromSeconds(3)
    }, async (exception, timeSpan) => await TakeRestaurantsOffline())
    .ExecuteAsync(async () => await TakeRestaurantsOffline());
```

Handle result

```csharp
var updatedOrderDelivery = await 
    Policy
    .HandleResult<OrderDelivery>(x => x.Status != DeliveryStatus.PRINTING)
    .WaitAndRetryAsync(_testFixture.RetryDefaultCount, x => _testFixture.ShortDelay)
    .ExecuteAsync(async () => (await _testFixture.GetOrderDeliveriesData(orderId)).Deliveries.First());

```
