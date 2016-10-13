# References

* https://developers.google.com/identity/sign-in/web/

# To create a client ID

1. Go to the Google API Console (https://console.developers.google.com/projectselector/apis/library)
2. In the sidebar under "API Manager", select Credentials, then select the OAuth consent screen tab.
Choose an Email Address, specify a Product Name, and press Save.
3. In the Credentials tab, select the New credentials drop-down list, and choose OAuth client ID.
   
# integrate sign-in

1. Load google platform library

   ```
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   ```
   
2. Specify the client id

   ```
   <meta name="google-signin-client_id" content="775560585226-d85t15fjbi05m3b6cvvdk2u5bgjhkecv.apps.googleusercontent.com">
   ```
   
3. Add a sign-in button

   ```
   <div class="g-signin2" data-onsuccess="onSignIn"></div>
   ```
