**Add / Remove a column**

```sql
ALTER TABLE [dbo].[Clt] ADD TokenLifetime int NOT NULL CONSTRAINT TokenLifetime_Default DEFAULT 3600
UPDATE [dbo].[Clt] SET TokenLifetime = 86400 WHERE Id = 'form'
```

**To import bacpac**
"Unable to import SQL Azure V12 BACPAC: “type Microsoft.Data.Tools.Schema.Sql.SqlAzureV12DatabaseSchemaProvider is not valid"

Install Cumulative Update 6. http://hotfixv4.microsoft.com/SQL%20Server%202014/nosp/SQLServer2014_RTM_CU6_3031047_12_0_2480_/12.0.2480.0/free/482290_intl_x64_zip.exe

**Set a Database to Single-user mode**

```sql
USE master;
GO
ALTER DATABASE AdventureWorks2012
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE AdventureWorks2012
SET READ_ONLY;
GO
ALTER DATABASE AdventureWorks2012
SET MULTI_USER;
GO
```

**Auto-generate INSERT statements for a table**

* Right click on the database and go to Tasks -> Generate Scripts
* Select the tables (or object) that you want to generate the script against.
* Go to Set scripting options and click on the Advanced button.
* In the General category, go to Type of data to script
* There are 3 options: Schema Only, Data Only, and Schema and Data. Select the appropriate option and click on OK.

# Sql

**Select records produced in the last hour**

```sql
SELECT  *
FROM    Whatever
WHERE   myTime > DATEADD(HOUR, -1, GETDATE())
```

**compare date**
```sql
 select *
   from Bidings b
  where 
    and b.Created >= CONVERT(DATETIME, '2016-03-30 18:30:00')
    and b.Created <= CONVERT(DATETIME, '2016-03-31 15:09:00')

```

**case statement**

```sql
 select *,
   Correction =
     case
       when s.Av + s.Dep < 100000 then 30
 	     when s.Av + s.Dep >= 100000 and s.Av + s.Dep < 200000 then 25
 	     when s.Av + s.Dep >= 200000 then 20
     end,
   from DeploymentStatistics s

```
