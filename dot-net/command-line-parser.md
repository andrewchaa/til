# Cli with CommandLineParser

Install

* CommandLineParser

Then parse the argument

```csharp
private const string MigrateUp = "migrate-up";
private const string MigrateDown = "migrate-down";

static void Main(string[] args)
{
    Parser.Default.ParseArguments<MigrationOptions>(args)
        .WithParsed(x =>
        {
            if (string.IsNullOrEmpty(x.Command))
            {
                Console.WriteLine("Available commands:\n");
                Console.WriteLine($"  dotnet run");
                Console.WriteLine($"    --command {MigrateUp}");
                Console.WriteLine($"    --command {MigrateDown} --version 0");
                return;
            }

            var sections = GetConnectionStrings();

            foreach (var section in sections)
            {
                var serviceProvider = CreateServices(section.Value);
                using var scope = serviceProvider.CreateScope();
                var runner = serviceProvider.GetRequiredService<IMigrationRunner>();

                switch (x.Command)
                {
                    case MigrateUp:
                        Console.WriteLine($"Migrating up for {section.Key} ...");
                        runner.MigrateUp();
                        break;
                    default:
                        Console.WriteLine($"Migrating down for {section.Key} ...");
                        runner.MigrateDown(x.Version);
                        break;
                }
            }
        });

```
