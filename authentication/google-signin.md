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

# scripts

```html
<div class="btn g-signin2" data-onsuccess="onSignIn" style="margin-left: -12px;"></div>
<a class="glyphicon glyphicon-question-sign" style="color: white;" title="Once you logs in, we'll remember your delivery address." href="#"></a>&nbsp;
<a href="#" onclick="signOut();" style="color: white;">Sign out</a>
```


```javascript
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}

function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    
    if (profile) {
        console.log('The user has signed in as ' + profile.getName());
        var email = profile.getEmail();
        
        $('#txtFullName').val(profile.getName());
        $('#txtEmail').val(email);

        $.get('/api/customers/' + email, function (response) {
            console.log(response);
            
            $('#txtFullName').val(response.fullName);
            $('#txtAddress').val(response.address);
            $('#txtPostCode1').val(response.postCode1);
            $('#txtPostCode2').val(response.postCode2);
            $('#txtPhone').val(response.phone);
        }).fail(function() {
            console.log('the customer (' + email + ') not found');
        });
    }
}

$(function () {
    gapi.load('auth2', function() {
        auth2 = gapi.auth2.getAuthInstance({
            client_id: 'xxxx.apps.googleusercontent.com',
            scope: 'profile'
        });

        if (auth2.isSignedIn.get()) {
            onSignIn(auth2.currentUser.get());
        }
    });
});
```
