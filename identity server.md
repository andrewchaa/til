# Resources

* Simple OAuth getting started: https://identityserver.github.io/Documentation/docs/overview/simplestOAuth.html
* Annoucing IdentityServer 4: http://leastprivilege.com/2016/01/11/announcing-identityserver-for-asp-net-5-and-net-core/
* Client samples: https://github.com/IdentityServer/IdentityServer3.Samples/tree/master/source/Clients
* JWT: http://bitoftech.net/2014/10/27/json-web-token-asp-net-web-api-2-jwt-owin-authorization-server/
* JWT Authentication in ASP.NET Web API: http://bitoftech.net/2015/02/16/implement-oauth-json-web-tokens-authentication-in-asp-net-web-api-and-identity-2/
* Authorisation server: https://github.com/IdentityModel/AuthorizationServer
* Simplest OAuth2: https://identityserver.github.io/Documentation/docsv2/overview/simplestOAuth.html
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

### for clients

#### Client Credentials flow

```powershell
install-package IdentityModel
install-package IdentityServer3
install-package IdentityServer3.AccessTokenValidation
```

#### Authorisation Code / Implicit flow
```powershell
install-package IdentityModel
install-package IdentityServer3
install-package IdentityServer3.AccessTokenValidation
install-package Microsoft.Owin.Security.OpenIdConnect
```

#### To protect APIs
```powershell
install-package IdentityModel
install-package IdentityServer3.AccessTokenValidation
```



## Set Up for OWIN

### Authorzation / Implicit flow

```csharp
const string clientId = "client id";
const string accessTokenEndpoinot = "token endpoint";
const string clientSecret = "client secret";
const string userInfoEndpoint = "user info endpoint";
const string identityServer = "https://identityserverlocal.marketinvoice.ninja/identity";
const string redirectUri = "https://mvcprototype/";
const string requestingScopes = "openid profile role publicWebsite offline_access";
const string requestingResponseTypes = "code id_token token";

AntiForgeryConfig.UniqueClaimTypeIdentifier = IdentityServer3.Core.Constants.ClaimTypes.Subject;
app.UseCookieAuthentication(new CookieAuthenticationOptions { AuthenticationType = "Cookies" });
app.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions {
    Authority = identityServer,
    ClientId = clientId,
    Scope = requestingScopes,
    ResponseType = requestingResponseTypes,
    RedirectUri = redirectUri,
    SignInAsAuthenticationType = "Cookies",
    UseTokenLifetime = true,

    Notifications = new OpenIdConnectAuthenticationNotifications {

        AuthorizationCodeReceived = async n =>
        {
            var tokenClient = new TokenClient(accessTokenEndpoinot, clientId, clientSecret);
            var tokenResponse = await tokenClient.RequestAuthorizationCodeAsync(n.Code, n.RedirectUri);

            var userInfoClient = new UserInfoClient(new Uri(userInfoEndpoint), tokenResponse.AccessToken);
            var userInfoResponse = await userInfoClient.GetAsync();

            // create new identity
            var id = new ClaimsIdentity(n.AuthenticationTicket.Identity.AuthenticationType);
            id.AddClaims(userInfoResponse.GetClaimsIdentity().Claims);
            id.AddClaim(new Claim("id_token", n.ProtocolMessage.IdToken));
            id.AddClaim(new Claim("access_token", tokenResponse.AccessToken));
            id.AddClaim(new Claim("expires_at", DateTime.Now.AddSeconds(tokenResponse.ExpiresIn).ToLocalTime().ToString()));
            id.AddClaim(new Claim("refresh_token", tokenResponse.RefreshToken));
            id.AddClaim(new Claim("sid", n.AuthenticationTicket.Identity.FindFirst("sid").Value));

            n.AuthenticationTicket = new AuthenticationTicket(new ClaimsIdentity(id.Claims, n.AuthenticationTicket.Identity.AuthenticationType), n.AuthenticationTicket.Properties);
        },

        RedirectToIdentityProvider = p =>
        {
            if (p.ProtocolMessage.RequestType == OpenIdConnectRequestType.LogoutRequest)
            {
                var idTokenHint = p.OwinContext.Authentication.User.FindFirst("id_token");

                if (idTokenHint != null)
                {
                    p.ProtocolMessage.IdTokenHint = idTokenHint.Value;
                }
            }

            return Task.FromResult(0);
        },
    }
});

```

### To protect APIs

```csharp
const string identityServer = "identity server uri";
const string requiredScope = "required scope";
app.UseIdentityServerBearerTokenAuthentication(new IdentityServerBearerTokenAuthenticationOptions() {
    Authority = identityServer,
    RequiredScopes = new[] { requiredScope }
});
```

## Flows

```csharp
public enum Flows
{
    AuthorizationCode,
    Implicit,
    Hybrid,
    ClientCredentials,
    ResourceOwner,
    Custom,
}
```

## Refresh token

* Supported for the following flows: authorization code, hybrid and resource owner password credential flow.
* code flow will call the token endpoint with client_id, client_secret, authorization code, and redirectUricalls. The token response will include id_token, access_token, and refresh_token

```csharp
AuthorizationCodeReceived = async n =>
{
    // use the code to get the access and refresh token
    var tokenClient = new TokenClient("token endpoint", "client id", "client secret");
    var tokenResponse = await tokenClient.RequestAuthorizationCodeAsync(n.Code, n.RedirectUri);

    // use the access token to retrieve claims from userinfo
    var userInfoClient = new UserInfoClient(new Uri("user info endpoint"), tokenResponse.AccessToken);
    var userInfoResponse = await userInfoClient.GetAsync();

    // create new identity
    var id = new ClaimsIdentity(n.AuthenticationTicket.Identity.AuthenticationType);
    id.AddClaims(userInfoResponse.GetClaimsIdentity().Claims);

    id.AddClaim(new Claim("id_token", n.ProtocolMessage.IdToken));
    id.AddClaim(new Claim("access_token", tokenResponse.AccessToken));
    id.AddClaim(new Claim("expires_at", DateTime.Now.AddSeconds(tokenResponse.ExpiresIn).ToLocalTime().ToString()));
    id.AddClaim(new Claim("refresh_token", tokenResponse.RefreshToken));
    id.AddClaim(new Claim("sid", n.AuthenticationTicket.Identity.FindFirst("sid").Value));

    n.AuthenticationTicket = new AuthenticationTicket(new ClaimsIdentity(id.Claims, 
        n.AuthenticationTicket.Identity.AuthenticationType), n.AuthenticationTicket.Properties);
},
```


### Response types

```csharp
// authorization code flow
public const string Code = "code";

// implicit flow
public const string Token        = "token";
public const string IdToken      = "id_token";
public const string IdTokenToken = "id_token token";

// hybrid flow
public const string CodeIdToken      = "code id_token";
public const string CodeToken        = "code token";
public const string CodeIdTokenToken = "code id_token token";
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

### ERROR Invalid flow for client: Implicit

ResponseTypeToFlowMapping
```csharp
{
    { ResponseTypes.Code, Flows.AuthorizationCode },
    { ResponseTypes.Token, Flows.Implicit },
    { ResponseTypes.IdToken, Flows.Implicit },
    { ResponseTypes.IdTokenToken, Flows.Implicit },
    { ResponseTypes.CodeIdToken, Flows.Hybrid },
    { ResponseTypes.CodeToken, Flows.Hybrid },
    { ResponseTypes.CodeIdTokenToken, Flows.Hybrid }
};
```

