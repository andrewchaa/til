```sql
DECLARE @userData TABLE(
    name varchar(30) NOT NULL,
    oldlocation varchar(30) NOT NULL
);

INSERT INTO @userData
SELECT name, location FROM myTable
INNER JOIN otherTable ON ...
WHERE age > 30;
```
