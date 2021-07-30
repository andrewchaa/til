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

