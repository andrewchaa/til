# MySql

1. [connection pooling](#connection-pooling)
1. [server variables](#server-variables)
1. [limit the result](#limit-the-result)
1. [date time](#date-time)

### server variables

```sql

show variables like 'max_connections'
select @@global.net_write_timeout;
select @@global.net_read_timeout;
select @@global.wait_timeout;
select @@global.connect_timeout;

```

### connection pooling

```sql
## check pool size
show variables like 'max_connections'

## set in connection string
Server=server;Port=3306;Database=db;Uid=uid;Pwd=pwd;Allow User Variables=True;maximumpoolsize=200

```

### limit the result

```sql
SELECT * FROM tbl_foo WHERE name = 'sarmen' LIMIT 1
```

### date time

```sql
SELECT * FROM JobLinkQueue 
   WHERE (BrandIndex = @brandId AND Status = 1)
      OR (BrandIndex = @brandId AND Status = 2 AND BookingDate < NOW() - INTERVAL 10 MINUTE)
  ORDER BY Status, `Index` LIMIT 1
```
