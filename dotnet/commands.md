# dotnet commands

command | description
-- | --
`dotnet test source/*.IntegrationTests/ --logger "console;verbosity=detailed"` | log ITestOutputHelper to the console
`dotnet test source/*.IntegrationTests/ --filter CreateConsignmentTests` | only run the tests with the name

