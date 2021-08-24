# Handling XML Request in ASP.NET Core controller

Resources

* https://docs.microsoft.com/en-us/aspnet/core/web-api/advanced/formatting?view=aspnetcore-5.0

Reference `Microsoft.AspNetCore.Mvc.Formatters.Xml`

```xml
<PackageReference Include="Microsoft.AspNetCore.Mvc.Formatters.Xml" Version="2.2.0" />
```

Add to the services.

```csharp
public void ConfigureServices(IServiceCollection services)
{

    services.AddControllers(o =>
    {
        o.RespectBrowserAcceptHeader = true;
    });
    services.AddMvc(o =>
        {
            o.OutputFormatters.Add(new XmlDataContractSerializerOutputFormatter());
        }).AddXmlSerializerFormatters()
        .AddXmlDataContractSerializerFormatters();
}
```

Decoreate the action method with `[Produces("text/xml")]` so that it returns an xml response.

The binding object for the request body needs to be `XmlDocument` 

```csharp
[HttpPost]
[Produces("text/xml")]
public IActionResult Report([FromBody]XmlDocument request)
{
    _logger.LogInformation(request.OuterXml);
```

If you return SOAP response, you need to wrap the content with SOAP Envelope

```xml
<soap:Envelope 
    xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" 
    xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" 
    xmlns:soapenc=""http://schemas.xmlsoap.org/soap/encoding/"" 
    xmlns:tns=""http://tempuri.org/"" 
    xmlns:types=""http://tempuri.org/encodedTypes"" 
    xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"">  
    <soap:Body soap:encodingStyle=""http://schemas.xmlsoap.org/soap/encoding/"">  
    </soap:Body>
</soap:Envelope>
```
