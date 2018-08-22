# moq

* [simple verify](#simple-verify)
* [return](#return)
* [any](#any)
* [return a different value each time](#return-a-different-value-each-time)
* [throwing errror](#throwing-errror)
* [mocking action](#mocking-action)

### simple verify

```csharp
_apiService = new Mock<IRestaurantEventApiService>();
_restaurantEventService = new RestaurantEventService(_apiService.Object,
    new Mock<IRestaurantService>().Object,
    new Mock<IConfigWrapper>().Object,
    new Mock<ILogger>().Object);

_adapter = new TestBuildRestaurantEventAdapter()
    .With(x => x.OfflineType = _tempOfflineType)
    .With(x => x.RestaurantIds = new [] {_restaurantIds.First()})
    .With(x => x.Username = _userName)
    .Build();

await _restaurantEventService.Handle(_adapter);

_apiService.Verify(a => a.OfflineRestaurant(
    It.Is<string>(x => x == _adapter.UserRole),
    It.Is<string>(x => x == _adapter.Requester),
    It.Is<string>(x => x == _adapter.Tenant),
    It.Is<int>(x => x == _restaurantIds.First()),
    It.Is<OfflineRestaurantRequest>(
        r => r.AllowRestaurantOverride == _adapter.AllowRestaurantOverride &&
             r.Duration == _adapter.Duration &&
             r.Name == _adapter.Name &&
             r.Reason == _adapter.Reason &&
             r.StartDate == _adapter.StartDate &&
             r.EndDate == _adapter.EndDate && 
             r.LegacyTempOfflineType == _tempOfflineType
             )
    ));

```

### return

```csharp
var loanRepository = new Mock<ILoanRepository>();

loanRepository.Setup(x => x.GetCarLoans()).Returns(loans);
loanRepository.Setup(x => x.GetCarLoans()).Returns(() => loans); // lazy evaluation
```

### any

```csharp
loanRepository.Setup(x => x.GetCarLoans(It.IsAny<string>())).Returns(loans);
```

### return a different value each time

```csharp
var random = new Random();
loanRepository.Setup(x => x.GetCarLoans()).Returns(loans).Callback(() => loans.GetRange(0,random.Next(1, 3));

_restaurantRepository.SetupSequence(r => r.TakeOffline(Tenant.Uk, _testRestaurantIds))
        .Throws<Exception>()
        .Throws<Exception>()
        .Throws<Exception>()
        .Throws<Exception>()
        .Returns(Task.CompletedTask);

```

### throwing errror

```csharp
loanRepository.Setup(x => x.GetCarLoans()).Throws<InvalidOperationException>();
```

### mocking action

```csharp
    _searchResource.Setup(s => s.SearchAsync<TicketResponse>(It.IsAny<Action<IZendeskQuery>>()))
      .Returns(Task.FromResult(_listTicketResponse));
```

