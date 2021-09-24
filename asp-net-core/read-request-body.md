# Read Request Body

The JSON body is automatically converted into DTO of you choice in the controller method. 
Recently I had a use case where I have to verify the content by HMACSHA256 the content with the given signature.
In this case, I needed the original JSON body the client sends to the API, rather than serializing the already deserialized body.

You can use [`JsonElement`](https://stackoverflow.com/questions/40494913/how-to-read-request-body-in-an-asp-net-core-webapi-controller)

```csharp
public async Task<IActionResult> Post(
    [FromHeader(Name = "X-Uber-Signature")] string signature, 
    [FromRoute] string tenantId,
    [FromBody] JsonElement webhookRequest)
    
    var webhookRequestJson = webhookRequest.ToString();
    if (!IsBodyValid(webhookRequestJson, signature, Encoding.UTF8.GetBytes(signingKey)))
    {
        return BadRequest("Invalid signature header");
    }
    
```
