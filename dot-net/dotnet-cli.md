# .NET Cli

### Build

    # build a project
    dotnet build
    
    # using release configuration
    dotnet build --configuration Release
    
    # build for a specific runtime
    dotnet build --runtime ubuntu.18.04-x64
    
### Run

    # build and run a project
    dotnet run 
    
    # build and run the project
    dotnet run --project src/Fonoa.TaxAuthorityEmulator/Fonoa.TaxAuthorityEmulator.csproj


    # run an assembly
    dotnet myapp.dll
