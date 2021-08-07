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
