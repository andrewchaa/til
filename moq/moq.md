# moq

* [simple verify](#simple-verify)
* [return](#return)
* [any](#any)
* [return a different value each time](#return-a-different-value-each-time)
* [throwing errror](#throwing-errror)
* [mocking action](#mocking-action)
* [mocking property](#mocking-property)
* [matching parameters](#matching-parameters)
* [callbacks](#callbacks)
* [loose vs. strict](#loose-vs-strict)

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

### mocking property

```csharp
public interface ILoanRepository
{
   LoanType LoanType{get;set;}
   float Rate {get;set;}
    
   List<LoanType> GetLoanTypes();
   List<Loan> GetCarLoans();
}

var loanRepository = new Mock<ILoanRepository>();
loanRepository.Setup(x => x.LoanType, LoanType.CarLoan);
loanRepository.Setup(x => x.Rate, 12.5);

loanRepository.SetupSet(x => x.Rate = 12.5F);
loanRepository.SetupGet(x => x.Rate);


```

### matching parameters

```csharp
List<Person> people = new List<Person>
{
    new Person { FirstName = "Donald", LastName = "Duke", Age =30},
    new Person { FirstName = "Ayobami", LastName = "Adewole", Age =20}
};

var loanRepository = new Mock<ILoanRepository>();
loanRepository.Setup(x => x.GetCarLoanDefaulters(It.IsInRange<int>(1, 5, Range.Inclusive))).Returns(people);
```

### callbacks

you can specify the callback to be invoked before and after a method is called

```csharp
var people = new List<Person>
{
    new Person { FirstName = "Donald", LastName = "Duke", Age =30},
    new Person { FirstName = "Ayobami", LastName = "Adewole", Age =20}
};

var loanRepository = new Mock<ILoanRepository>();

loanRepository.Setup(x => x.GetCarLoanDefaulters())
    .Callback(() => CarLoanDefaultersCallbackAfter ())
    .Returns(() => people)
    .Callback(() => CarLoanDefaultersCallbackAfter());
    
public void CarLoanDefaultersCallback()
{
    people.Add(new Person { FirstName = "John", LastName = "Doe", Age =40});
}

public void CarLoanDefaultersCallbackAfter()
{
    people.RemoveAt(0);
}
```

Callback to handle the called argument

```csharp
backupAccountDataStore.Setup(b => b.UpdateAccount(It.IsAny<Account>())).Callback<Account>((ac) =>
    account = ac);
```

### loose vs. strict

When a Loose member is selected, the mock will not throw any exceptions. The default values will always be returned. This means null will be returned for reference types, and zero or empty arrays and enumerables will be returned for value types

Tge default behaviour of the mock is loose.

```csharp
loanRepository= new Mock<ILoanRepository>(MockBehavior.Loose);
loanRepository= new Mock<ILoanRepository>(MockBehavior.Strict);

```
