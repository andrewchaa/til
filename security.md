#### Resources

* JWT: http://bitoftech.net/2014/10/27/json-web-token-asp-net-web-api-2-jwt-owin-authorization-server/
* JWT Authentication in ASP.NET Web API: http://bitoftech.net/2015/02/16/implement-oauth-json-web-tokens-authentication-in-asp-net-web-api-and-identity-2/
* Authorisation server: https://github.com/IdentityModel/AuthorizationServer
* Simplest OAuth2: https://identityserver.github.io/Documentation/docsv2/overview/simplestOAuth.html
* OpenID: https://openid.net/

##### load a certificate from windows certificate store

```csharp
static void Main(string[] args)
{
    X509Certificate2 cer = new X509Certificate2();
    cer.Import(@"D:\l.cer");
    X509Store store = new X509Store(StoreLocation.CurrentUser);
    store.Certificates.Add(cer);

     X509Certificate2Collection cers = store.Certificates.Find(X509FindType.FindBySubjectName, "My Cert's Subject Name", false);
    if (cers.Count>0)
    {
        cer = cers[0];
    };
    store.Close();
}
```
