# Refit

### Resource

* https://github.com/reactiveui/refit


### Usage

```csharp
// create interface
public interface IRestaurantEventApi
{
    [Post("/v1/{tenant}/restaurants/{restaurantId}/events/offline")]
    Task<RestaurantOfflineEventResponse> OfflineRestaurant(string tenant, int restaurantId);
}


```
