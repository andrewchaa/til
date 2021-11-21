# Create a new certificate

Create a new certificate

XCode > Preference > Account > Manage certificates

Go to the [certificate list](https://developer.apple.com/account/resources/certificates/list)
    
Download your certificate to your Mac, then double click the .cer file
to install in Keychain Access.
Make sure to save a backup copy of your private and public keys somewhere secure


Associate profile with certificate

* go to https://developer.apple.com/account/resources/profiles/list
* Edit the profile and select the certificate to associate
* Download the profile.
* On XCode, import the profile (Distribute App flow)
