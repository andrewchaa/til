# ASP.NET Parameter Mappings

* `[FromRoute] string tenantId`
* `[FromBody] UberWebhookRequest uberWebhookRequest`
* `[FromHeader(Name = "X-Uber-Signature")] string uberSignature`

```csharp
[HttpPost("{tenantId}")]
public IActionResult Post(
    [FromHeader(Name = "X-Uber-Signature")] string uberSignature,
    [FromRoute] string tenantId,
    [FromBody] UberWebhookRequest uberWebhookRequest)
{

```
