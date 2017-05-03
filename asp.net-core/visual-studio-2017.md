* http://stackoverflow.com/questions/40674393/visual-studio-2017-install-breaks-visual-studio-2015-asp-net-core-projects

## Target .NET 4.6

```
<Project Sdk="Microsoft.NET.Sdk.Web">
 
  <PropertyGroup>
    <TargetFramework>netcoreapp1.1</TargetFramework>
  </PropertyGroup>
 
  <ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore" Version="1.1.1" />
    <PackageReference Include="Microsoft.AspNetCore.Mvc" Version="1.1.2" />
    <PackageReference Include="Microsoft.AspNetCore.StaticFiles" Version="1.1.1" />
    <PackageReference Include="Microsoft.Extensions.Logging.Debug" Version="1.1.1" />
    <PackageReference Include="Microsoft.VisualStudio.Web.BrowserLink" Version="1.1.0" />
  </ItemGroup>
 
</Project>

<PropertyGroup>
  <TargetFramework>net46</TargetFramework>
</PropertyGroup>
```
