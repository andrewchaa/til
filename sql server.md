# Installation

## To import bacpac
"Unable to import SQL Azure V12 BACPAC: “type Microsoft.Data.Tools.Schema.Sql.SqlAzureV12DatabaseSchemaProvider is not valid"

Install Cumulative Update 6. http://hotfixv4.microsoft.com/SQL%20Server%202014/nosp/SQLServer2014_RTM_CU6_3031047_12_0_2480_/12.0.2480.0/free/482290_intl_x64_zip.exe


## Set a Database to Single-user mode

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
