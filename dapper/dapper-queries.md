**Resources**

* Dapper examples: https://github.com/StackExchange/dapper-dot-net/blob/master/Dapper.Tests/Tests.cs


Multiple queries

```csharp
            var sqlCount = @"
                SELECT COUNT(*) 
                  FROM Companies c JOIN Entities e 
                    ON e.EntityId = c.CompanyId
";
            var sqlCompanies = @"
                SELECT *
                  FROM Companies c JOIN Entities e 
                    ON e.EntityId = c.CompanyId
                 WHERE e.TenantId = @tenantId
                 ORDER BY e.EntityId
                OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY
";
            using var connection = new SqlConnection(connectionString);
            connection.Open();

            var results = await connection.QueryMultipleAsync($"{sqlCount};{sqlCompanies};", new
            {
                tenantId,
                offset = pageSize * (page - 1),
                pageSize
            });

            var totalResults = await results.ReadFirstOrDefaultAsync<int>();
            var companies = await results.ReadAsync<Company>();

```

```csharp
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
```
