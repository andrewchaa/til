# Handling XML Request in ASP.NET Core controller

Resources

* https://docs.microsoft.com/en-us/aspnet/core/web-api/advanced/formatting?view=aspnetcore-5.0

Reference `Microsoft.AspNetCore.Mvc.Formatters.Xml`

```xml
<PackageReference Include="Microsoft.AspNetCore.Mvc.Formatters.Xml" Version="2.2.0" />
```

Add to the services.

```csharp
services.AddMvc(o =>
{ }).AddXmlSerializerFormatters();
```

The object should be `XmlDocument`

```csharp
[HttpPost]
public IActionResult Report([FromBody]XmlDocument request)
{
    _logger.LogInformation(request.OuterXml);
    return Ok(request.OuterXml);
}
```
