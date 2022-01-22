# Getting started with Fluent Migration

### Resource

* [Fluent Migrator](https://fluentmigrator.github.io/)


Install the packages to your project

* FluentMigrator
* FluentMigrator.Extensions.SqlServer
* FluentMigrator.Runner
* FluentMigrator.Runner.SqlServer
* FluentMigrator.Console : to run in console


An example

```csharp
[Migration(1)]
public class CreateFunctions001 : Migration
{
    public override void Up()
    {
        Execute.Script(Path.Combine(Directory.GetCurrentDirectory(), "Scripts/001/dp_GetAllocatedInventorySoQty.sql"));
    }

    public override void Down()
    {
    }
}
```

```sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dp_GetAllocatedInventorySoQty] (
    @itemNo NVARCHAR(20),
    @locationCode NVARCHAR(10),
    @supplyType INT,
    @shipmentLineNo INT,
    @shipmentNo NVARCHAR(20),
    @ExcludeDocNo NVARCHAR(20)
)
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
    DECLARE @qty int;
SELECT @qty = SUM([Quantity])
FROM [dbo].[Aurora World Ltd_$Allocation Entry] ae
WHERE ae.[Item No_] = @itemNo
  AND ae.[Location Code] = @locationCode
  AND ae.[Supply Type] = @supplyType
  AND ae.[Warehouse Shipment Line No_] = @shipmentLineNo
  AND ae.[Warehouse Shipment No_] = @shipmentNo
  AND ae.[Demand Document No_] NOT LIKE @ExcludeDocNo
    RETURN(@qty)
END;
GO

```

```csharp
[Migration(202107302306)]
public class DefaultCountryIsoCodeIndex : Migration
{
    private const string column = "CountryCode";
    private const string schema = "dbo";
    private const string table = "Companies";
    public override void Up()
    {
        Execute.Script(
            $"CREATE INDEX IX_{table}_{column} ON {schema}.{table} ({column})");
    }

    public override void Down()
    {
        Execute.Script(
            $"DROP INDEX IX_{table}_{column} ON {schema}.{table}");
    }
}
```

### Running the migration

For cross-platform, install `FluentMigrator.DotNet.Cli`
Before you run the cli, make sure to do `dotnet publish`.

https://fluentmigrator.github.io/articles/runners/dotnet-fm.html

    dotnet tool install -g FluentMigrator.DotNet.Cli
    dotnet fm migrate -p sqlite -c "Data Source=test.db" -a ".\bin\Debug\netcoreapp2.1\test.dll"
