1. In Settings, enter your custom domain, www.londoneducationtour.com
2. Create a CNAME record that points from your default pages domain, such as YOUR-GITHUB-USERNAME.github.io to your subdomain. Your DNS changes can take over a full day to update and the wait varies among DNS and hosting providers.

  * www, andrewchaa.github.io
  * @, http://www.asianlancook.org

3. Test if the domain is correctly set up
   
   ```
   dig www.londoneducationtour.com +nostats +nocomments =nocmd
   ```
