# AWS - S3

* [creating static website](#creating-static-website)

### creating static website

**Bucket**

* Create a bucket
* The name should follow your public domain, like "www.sundodiary.club"

**CloudFront**

Create a cloudfront distribution. Put cnames

* Origin Domain Name: bucket name
* Origin ID: auto created
* Default Cache Behaviour - Viewer Protocil Policy: HTTP and HTTPS
* Allowed HTTP Methods: GET, HEAD
* Object Caching: Customise (for testing), once done, use Origin Cache headers
* Distribution Settins - Price Class: US, Canada, Europe, Asia and Africa, for cost-saving
* Default Root object: index.html


**Route 53**

* create hosted zone, named after your domain like "sundodiary.club". This will create two recordsets
* Create two alias recordsets, one for "www" and the other without "www" like "sundodiary.club". The type is A - IPv4 address and Alias is Yes. The alias target would be a cloudfront domain

**DNS Provider**

* Change your DNS provider to use AWS Nameserver. 
* Click the created hosted zone. On the right side pane, find Name Servers. Update your domain's nameserver with those.
 

