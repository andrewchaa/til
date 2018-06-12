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
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

```

// back up s3 bucket
aws s3 sync s3://www.hyeeun-acupuncture.co.uk .
```
