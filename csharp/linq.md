# Interesting linq statements

### Create a batch from a collection

```csharp
public static class EnumerableExtensions
{
    public static IEnumerable<IEnumerable<T>> Batch<T>(this IEnumerable<T> items, int maxItems)
    {
        return items
            .Select((item, inx) => new { item, inx })
            .GroupBy(x => x.inx / maxItems)
            .Select(g => g.Select(x => x.item));
    }
}

var batches = _records
    .Select(x => new CrRecord
    {
        AuthCode = x.AuthCode,
        Amount = x.Amount,
        CreditAmount = x.CreditAmount,
        Date = x.Date,
    })
    .Batch(100)
    .ToList();
                
```

### Where list contains another list

```csharp
var deliveries = Deliveries.Where(x =>
{
    var lineItemIdsInDelivery = x.OrderItems.Select(o => o.Id);
    var itemIdsInOrder = orderItemIds.Select(o => o.Value);
    return lineItemIdsInDelivery.Intersect(itemIdsInOrder).Any();
});

```
