# Getting started with Fluent Migration

### Resource

* [Fluent Migrator](https://fluentmigrator.github.io/)

An example

```csharp
using FluentMigrator;

namespace test
{
    [Migration(20180430121800)]
    public class AddLogTable : Migration
    {
        public override void Up()
        {
            Create.Table("Log")
                .WithColumn("Id").AsInt64().PrimaryKey().Identity()
                .WithColumn("Text").AsString();
        }

        public override void Down()
        {
            Delete.Table("Log");
        }
    }
}
```

Install the packages to your project

* FluentMigrator
* FluentMigrator.Extensions.SqlServer
* FluentMigrator.Runner
* FluentMigrator.Runner.SqlServer

Create a migration class

```
[Migration(202107302306)]
public class DefaultCountryIsoCodeIndex : Migration
{
    private const string column = "CountryCode";
    private const string schema = "dbo";
    private const string table = "Companies";
    public override void Up()
    {
        Execute.Script(
            $"CREATE INDEX IX_Entities_{column} ON {schema}.{table} ({column})");
    }

    public override void Down()
    {
        Execute.Script(
            $"DROP INDEX IX_Entities_{column} ON {schema}.{table}");
    }
}
```
