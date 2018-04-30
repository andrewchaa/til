```csharp
public static implicit operator int(RestaurantId id)
{
    return id.Id;
}

public static explicit operator RestaurantId(int id)
{
    return new RestaurantId(id);
}

```
