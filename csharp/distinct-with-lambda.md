http://stackoverflow.com/questions/1300088/distinct-with-lambda

```csharp
IEnumerable<Customer> filteredList = originalList
  .GroupBy(customer => customer.CustomerId)
  .Select(group => group.First());
```
