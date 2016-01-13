# Resources

* Simple OAuth getting started: https://identityserver.github.io/Documentation/docs/overview/simplestOAuth.html
* Annoucing IdentityServer 4: http://leastprivilege.com/2016/01/11/announcing-identityserver-for-asp-net-5-and-net-core/

# OpenId Authentication

## interactions

* Client: GET client's /Home/UserLogin 
* Server: GET /identity/.well-known/openid-configuration, returning the details of the server
* Server: GET /identity/.well-known/jwks
* Client: Redirect to /identity/connect/authorize
* Server: GET /identity/connect/authorize?client_id=MvcPrototype&redirect_uri=https%3a%2f%2fmvcprototype%2f&response_mode=form_post&response_type=id_token+token&scope=openid+profile+role+publicWebsite+miApi&state=OpenIdConnect.AuthenticationProperties%3dnkKmPYwrkOBWDojiMCDNqI6_Xo1Ms12iPebp7lvOku9I4sp2YNYVfZL4SokzhB8kS4m_Lu7WvjXTFCkKoVF9PJJeYyNii-cURC4vyXXTG7tpLc06eFeszB1kxM65DTHSmTCZiMbvRH6b29-pnvVZkWsvKdwIUgdmHJAal_o5AHk5JUG4wQlcyJZZFALZAhapMzuQApxTbW-f7ohYrK1owg&nonce=635882920865285418.MmMxMzllNzUtNTRkOS00MjBiLWE4OWMtMzEzZWQ2YzZjNTgyYTNiNzVkODItYmMxZS00Y2U1LWFhYmQtZjg1MDgyYmExNDVk
* Server: POST /identity/connect/consent?client_id=MvcPrototype&redirect_uri=https%3A%2F%2Fmvcprototype%2F&response_mode=form_post&response_type=id_token%20token&scope=openid%20profile%20role%20publicWebsite%20miApi&state=OpenIdConnect.AuthenticationProperties%3DnkKmPYwrkOBWDojiMCDNqI6_Xo1Ms12iPebp7lvOku9I4sp2YNYVfZL4SokzhB8kS4m_Lu7WvjXTFCkKoVF9PJJeYyNii-cURC4vyXXTG7tpLc06eFeszB1kxM65DTHSmTCZiMbvRH6b29-pnvVZkWsvKdwIUgdmHJAal_o5AHk5JUG4wQlcyJZZFALZAhapMzuQApxTbW-f7ohYrK1owg&nonce=635882920865285418.MmMxMzllNzUtNTRkOS00MjBiLWE4OWMtMzEzZWQ2YzZjNTgyYTNiNzVkODItYmMxZS00Y2U1LWFhYmQtZjg1MDgyYmExNDVk
* Client: POST /, Validate token
* Server: GET /identity/connect/userinfo, returns user info, {"sub":"iamuser@marketinvoice.com","name":"A User","id":"1","role":"Seller"}
* Client: Redirect to /Home/UserLogin
* Client: GET /Home/UserLogin

## Setting user claims

```csharp
public override Task GetProfileDataAsync(ProfileDataRequestContext context)
{
    // issue the claims for the user
    using (var db = new MiDataContext())
    {
        var subject = context.Subject.GetSubjectId();
        var user = db.Users.SingleOrDefault(u => u.Email == subject);
        if (user != null)
        {
            var claims = new List<Claim>
            {
                new Claim(Constants.ClaimTypes.Subject, user.Email),
                new Claim(Constants.ClaimTypes.Name, user.Name),
                new Claim(Constants.ClaimTypes.Id, user.UserId.ToString()),
                new Claim(Constants.ClaimTypes.Role, user.Role.Name)
            };
            context.IssuedClaims = claims;
        }

    }

    return Task.FromResult(0);
}

```

# Identity Server client

## required libraries

```powershell
install-package Microsoft.Owin.Security.OpenIdConnect
install-package IdentityServer3
install-package IdentityServer3.AccessTokenValidation
```

# Troubleshootings

## Endless redirection

The protected page keeps redirecting the browser to the login server

Add cookie authentication to OWIN

```csharp
app.UseCookieAuthentication(new CookieAuthenticationOptions {
    AuthenticationType = "Cookies"
});
```

## AntiForgeryToken() error

### nameidentifier doesn't exist

"A claim of type 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier' or 'http://schemas.microsoft.com/accesscontrolservice/2010/07/claims/identityprovider' was not present on the provided ClaimsIdentity"

Specify ClaimTypes.Subject as unique claim type identifier

```csharp
AntiForgeryConfig.UniqueClaimTypeIdentifier = IdentityServer3.Core.Constants.ClaimTypes.Subject;
```

### "A claim of type 'sub' was not present on the provided ClaimsIdentity."

Make sure you have added subject claims on the server

```csharp
var claims = new List<Claim>
{
    new Claim(Constants.ClaimTypes.Subject, user.Email),
    new Claim(Constants.ClaimTypes.Name, user.Name),
    new Claim(Constants.ClaimTypes.Id, user.UserId.ToString()),
    new Claim(Constants.ClaimTypes.Role, user.Role.Name)
};
context.IssuedClaims = claims;
```
