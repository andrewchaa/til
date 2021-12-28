# Creating resources in multi region

You can specify the region the resources will be created.

```terraform
# provider.tf
provider "aws" {
  region = "eu-west-1"
  assume_role {
    role_arn = var.assume_role_arn
  }
}

provider "aws" {
  alias  = "euwest2"
  region = "eu-west-2"
  assume_role {
    role_arn = var.assume_role_arn
  }
}

# kms.tf
resource "aws_kms_key" "primary" {
  description         = "primary key for dynamodb"
  enable_key_rotation = true
  tags                = var.resource_tags
}

resource "aws_kms_key" "secondary" {
  provider            = aws.euwest2
  description         = "secondary key for dynamodb"
  enable_key_rotation = true
  tags                = var.resource_tags
}
```
