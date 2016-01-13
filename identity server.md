# Resources

* Simple OAuth getting started: https://identityserver.github.io/Documentation/docs/overview/simplestOAuth.html

## Get user claims

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

## Troubleshootings

### The protected page keeps redirecting the browser to the login server

Add cookie authentication to OWIN

```csharp
app.UseCookieAuthentication(new CookieAuthenticationOptions {
    AuthenticationType = "Cookies"
});
```

### AntiForgeryToken() error

"A claim of type 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier' or 'http://schemas.microsoft.com/accesscontrolservice/2010/07/claims/identityprovider' was not present on the provided ClaimsIdentity"

* Specify ClaimTypes.Subject as unique claim type identifier

```csharp
AntiForgeryConfig.UniqueClaimTypeIdentifier = IdentityServer3.Core.Constants.ClaimTypes.Subject;
```
