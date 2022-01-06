# Test Data Builder

When you write tests, you have to populate lots of data. It's handy to have data builder

```csharp
public class OrderDeliveryDataBuilder
{
    private readonly OrderDeliverySpec _spec = new OrderDeliverySpec();
    public OrderDelivery Build()
    {
        return new OrderDelivery
        {
            OrderId = _spec.OrderId,
            DeliveryId = _spec.DeliveryId,
            Status = DeliveryStatus.PRINTING,
            PostalRecipient =
                new PostalRecipient
                {
                    AddressFirstLine = "Herbal House",
                    City = "London",
                    FirstName = "Firstname",
                    Id = Guid.NewGuid().ToString(),
                    Country = "United Kingdom",
                    IsMyAddress = true,
                    LastName = "Lastname",
                    Postcode = "EC4R 4SA",
                    Title = "Miss"
                },
            DeliveryDate = DateTime.Today,
            EstimatedDispatchDate = DateTime.Today,
            ActualDispatchDate = DateTime.Today,
            DeliveryInformation =
                new OrderDeliveryInformation
                {
                    FullTrackingUrl = string.Empty,
                    PostageType = PostageType.UK_MAIL,
                    TrackingNumber = string.Empty
                },
            OrderItems = new[] { new OrderItem { Id = Guid.NewGuid().ToString(), Quantity = 2 } },
            MobileNumber = string.Empty,
            Instructions = string.Empty,
            FulfilmentCentre = new FulfilmentCentre { CountryCode = "UK", Id = Guid.NewGuid().ToString() },
            GiftNote = String.Empty
        };

    }

    public OrderDeliveryDataBuilder With(Action<OrderDeliverySpec> action)
    {
        action(_spec);
        return this;
    }
}

public class OrderDeliverySpec
{
    public string OrderId { get; set; }
    public string DeliveryId { get; set; }

    public OrderDeliverySpec()
    {
        OrderId = Guid.NewGuid().ToString();
        DeliveryId = Guid.NewGuid().ToString();
    }
}

```
