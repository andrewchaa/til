# AWS - S3

* [creating static website](#creating-static-website)

### creating static website

#### Bucket

* Create a bucket
* The name should follow your public domain, like "www.sundodiary.club"

#### CloudFront

* create a cloudfront distribution. Put cnames

#### Route 53

* create hosted zone, named after your domain like "sundodiary.club". This will create two recordsets
* Create two alias recordsets, one for "www" and the other without "www" like "sundodiary.club". The type is A - IPv4 address and Alias is Yes. The alias target would be a cloudfront domain


 

