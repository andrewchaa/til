```sql
SELECT * FROM JobLinkQueue 
   WHERE (BrandIndex = @brandId AND Status = 1)
      OR (BrandIndex = @brandId AND Status = 2 AND BookingDate < NOW() - INTERVAL 10 MINUTE)
  ORDER BY Status, `Index` LIMIT 1

```
