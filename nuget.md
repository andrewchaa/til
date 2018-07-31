# NuGet

* [Basic usages](#basic-usages)
* [Detected package downgrade error](#detected-package-downgrade-error)
* [reinstall package](#reinstall-package)

### reinstall package

```powershell
Update-Package -reinstall JE.Restaurant.Contracts
```

### Detected package downgrade error

Remove NU1605 from "Trust warnings as errors" on Build tab of the project

### Basic usages

```powershell

// Restore packages
.\nuget\nuget.exe restore

// Update a package
Update-Package MarketInvoice.Infrastructure.Audit

// Install a specific version
Install-Package Microsoft.Web.WebJobs.Publish -Version 1.0.3

// Setting up a cache
C:\Users\a.chaa\AppData\Local\NuGet\Cache

// Get packages and their installed projects**
PM> Get-Package -Filter Ninject

Id                                  Versions                                 ProjectName
--                                  --------                                 -----------
Ninject                             {3.2.2.0}                                MarketInvoice.Reconciliation.Tests               
Ninject                             {3.2.2.0}                                MarketInvoice.Reconciliation.Api     

// publishing package
1. Edit .csproj

<PropertyGroup>
    <TargetFramework>netcoreapp2.0</TargetFramework>
    <GeneratePackageOnBuild>true</GeneratePackageOnBuild>
    <PackageId>FunctionalWay</PackageId>
    <Version>0.0.9</Version>
    <Authors>Andrew Chaa</Authors>
</PropertyGroup>

2. dotnet pack
3. dotnet push

dotnet nuget push FunctionalWay.0.0.9.nupkg -k <key> -s https://api.nuget.org/v3/index.json
```
