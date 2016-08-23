**Basic data**

You need to have 1) Clients, 2) Scopes, and 3) Claims

1. Client
   
   It has client id and name, specifying flow, allowed scopes, client secret, and access token lifetime
   
   ex) admin, Admin, "openid, profile, role, api", hasehd_secret, token_lifetime
   
2. Scope
   
   You have standard scopes like openid, profile and role, and custom scopes. A client's allowed scopes should be present in the table
   
   ex) openid, standard
   
3. Claim
   
   A claim that would be included in the token. For example, if you want to include role claim, Claims table should have role entry.
   
   ex) role
