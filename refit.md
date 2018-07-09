# Refit

* [Resource](#resource)
* [Usage](#usage)

### Resource

* https://github.com/reactiveui/refit


### Usage

```csharp

// create interface
// set verb, route, header, and body
[Post("/v1/{tenant}/restaurants/{restaurantId}/events/offline")]
Task<RestaurantOfflineEventResponse> OfflineRestaurant(
    [Header("X-JE-User-Role")] string userRole, 
    [Header("X-JE-Requester")] string requester, 
    string tenant, 
    int restaurantId);


```
