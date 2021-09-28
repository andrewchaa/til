# aws cli

* [Download and Install CLI Bundle](https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-bundle.html#install-bundle-other)
* [Install CLI](#install-cli)


### Install cli

```
// download aws cli bundled installer
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

// unzip the package
unzip awscli-bundle.zip

// install cli bundle
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

// configure for first-time use
aws configure

// back up s3 bucket
aws s3 sync --delete ./dist s3://www.jsbeautifieronline.net --acl public-read
```

### Set up `./aws` on Mac

Named Profiles

    [default]
    region=eu-west-1

    [navien]
    region=eu-west-1
    
    [profile dolphin]
    region=eu-west-1
    
