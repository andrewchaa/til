**async within event handler**

Use Task.Run(). Otherwise, the async wouldn't be able to attach itself to the thread back

```csharp
public void Handle(ImportedEvent ev)
{
    LogManager.GetLogger("Transactions").LogInfo("Sending {0} new payments",ev.NewTransactions.Count);
    
    Task.Run(() => _client.SendTransactions(ev.NewTransactions));
}
```

**Secure cookie**

```csharp
var authCookie = new HttpCookie(AuthToken)
{
    Expires = DateTime.UtcNow.AddHours(24),
    Secure = true,
    HttpOnly = true,
    Value = result.AccessToken
};

HttpContext.Current.Response.SetCookie(authCookie);
```

**config file transformation**

```xml
<!-- web.config -->
<logger name="*" minlevel="Debug" writeTo="logentries,file" />

<!-- web.Staging.config -->
<logger name="*" minlevel="Debug" xdt:Transform="SetAttributes(minlevel)" xdt:Locator="Match(name)" />
<logger name="*" writeTo="logentries" xdt:Transform="SetAttributes(writeTo)" xdt:Locator="Match(name)" />
```

**Send http status code from MVC controller**

```csharp
return new HttpStatusCodeResult(HttpStatusCode.OK);
```

