```csharp
using (var connection = new MySqlConnection(_connectionString))
{
    connection.Open();
    using (var transaction = connection.BeginTransaction())
    {
        var jobLinkQueue = connection.QuerySingleOrDefault<JobLinkQueueDto>(
            @"SELECT * FROM JobLinkQueue 
               WHERE (BrandIndex = @brandId AND Status = 1)
                  OR (BrandIndex = @brandId AND Status = 2 AND BookingDate < NOW() - INTERVAL 10 MINUTE)
              ORDER BY Status, `Index` LIMIT 1", new { brandId });

        if (jobLinkQueue == null) return null;

        jobLinkQueue.Status = (int)JobLinkQueueStatus.Parsing;
        jobLinkQueue.BookingDate = DateTime.Now;
        jobLinkQueue.Booking = botName;

        connection.Execute(UpdateSql, jobLinkQueue);
        transaction.Commit();

        return jobLinkQueue;
    }
}

```
