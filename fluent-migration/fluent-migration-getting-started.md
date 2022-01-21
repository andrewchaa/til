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


Create a migration class

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

https://fluentmigrator.github.io/articles/runners/dotnet-fm.html

    dotnet tool install -g FluentMigrator.DotNet.Cli
    dotnet fm migrate -p sqlite -c "Data Source=test.db" -a ".\bin\Debug\netcoreapp2.1\test.dll"
