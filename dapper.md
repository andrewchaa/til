**Resources**

* Dapper examples: https://github.com/StackExchange/dapper-dot-net/blob/master/Dapper.Tests/Tests.cs

## Usages

    // String or binary data would be truncated.
    Id column is int. I was using long in the code
    
    // Update
    using (var connection = new SqlConnection(_connectionString)
    {
        await connection.OpenAsync();
        await connection.ExecuteAsync(@"
            UPDATE Restaurant
               SET Offline = 1,
                   OfflineText = 'Offline By Restaurant.Events',
                   OfflineType = @offlineType,
                   OfflineSetDate = @date,
                   State = @restaurantState
             WHERE Id in @restaurantIds",
            new
            {
                offlineType = RestaurantOfflineType.ClosedDueToEvent,
                date = DateTime.UtcNow,
                restaurantState = RestaurantState.TemporaryOffline,
                restaurantIds = restaurantIds.Select(r => r.Id).ToArray()
            });
    }
    
