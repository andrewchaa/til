#### query all tables containing a column name

```sql
SELECT c.name AS ColName, t.name AS TableName 
  FROM sys.columns c
  JOIN sys.tables t ON c.object_id = t.object_id
 WHERE c.name LIKE '%Network%'
```
