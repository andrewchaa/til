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

