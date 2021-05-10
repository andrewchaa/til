```
curl -s --user 'api:<api key>' \
    https://api.mailgun.net/v3/<domain name>/messages \
    -F from='Excited User <mailgun@domain>' \
    -F to=user@mail.com \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomness!'
```

* -s, --silent: Silent or quiet mode. 
* -F, --form (HTTP) This lets curl emulate a filled-in form in which a user has pressed the submit button. This causes curl to POST data using the Content-Type multipart/form-data according to RFC 2388
* -u, --user <user:password>: user password. 


