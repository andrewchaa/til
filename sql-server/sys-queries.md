#### query all tables containing a column name

```sql
SELECT c.name AS ColName, t.name AS TableName 
  FROM sys.columns c
  JOIN sys.tables t ON c.object_id = t.object_id
 WHERE c.name LIKE '%Network%'
```

#### check user or role's permission

```sql
select  princ.name
,       princ.type_desc
,       perm.permission_name
,       perm.state_desc
,       perm.class_desc
,       object_name(perm.major_id)
from    sys.database_principals princ
join    sys.database_permissions perm
  on    perm.grantee_principal_id = princ.principal_id
 where  princ.name = 'Asset'

```
