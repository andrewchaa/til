**Resources**

* https://developer.linkedin.com/docs/oauth2
* http://www.oauthforaspnet.com/providers/linkedin/

**Setting up**

1. Create an application. https://www.linkedin.com/secure/developer?newapp=

   Ensure the "OAuth 2.0 Redirect URLs" field for your application contains a valid callback URL to your server that is listening to complete your portion of the authentication workflow.
   https://pstage.marketinvoice.ninja/auth/linkedin

2. Request an Authorization Code
   
   Redirect the user to LInkedIn's OAuth 2.0 authorisation endpoint. 
   https://www.linkedin.com/oauth/v2/authorization

   example
   
   https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=123456789&redirect_uri=https%3A%2F%2Fwww.example.com%2Fauth%2Flinkedin&state=987654321&scope=r_basicprofile

3. Exchange Authorization Code for an Access Token

   POST "x-www-form-urlencoded" 
   
   https://www.linkedin.com/oauth/v2/accessToken
   
   ```
   POST /oauth/v2/accessToken HTTP/1.1
   Host: www.linkedin.com
   Content-Type: application/x-www-form-urlencoded
  
   grant_type=authorization_code&code=987654321&redirect_uri=https%3A%2F%2Fwww.myapp.com%2Fauth%2Flinkedin&client_id=123456789&client_secret=shhdonottell   
   ```
   
4. Make authenticated request
5. Refresh your Access Tokens

