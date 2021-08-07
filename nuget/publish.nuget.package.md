# Publishing a nuget package

1. Edit .csproj

```xml
<PropertyGroup>
    <TargetFramework>netcoreapp2.0</TargetFramework>
    <GeneratePackageOnBuild>true</GeneratePackageOnBuild>
    <PackageId>FunctionalWay</PackageId>
    <Version>0.0.9</Version>
    <Authors>Andrew Chaa</Authors>
</PropertyGroup>
```

2. dotnet pack
3. dotnet push


```
dotnet nuget push FunctionalWay.0.0.9.nupkg -k <key> -s https://api.nuget.org/v3/index.json
```

### Publish the package to Github Registry

[Create a PAT (Personal Access Token)](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)

* Go to Settings > Developer settings
* Create a PAT

Create a nuget config

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="github" value="https://nuget.pkg.github.com/{{your organisation}}/index.json" />
  </packageSources>
</configuration>

```

Publish the package

    dotnet nuget push "Fonoa.Optimus.MetricsLib.0.1.0.nupkg" -k {{ your pat }} --source "github"
    
