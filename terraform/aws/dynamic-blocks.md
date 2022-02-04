# dynamic blocks

```terraform
locals {
  database_tags = var.brand_alias == "brand" ? merge(var.resource_tags, { "map-dba" : "d-server-xxxxxx" }) : var.resource_tags
  regions       = var.brand_alias == "brand" ? ["eu-central-1"] : ["us-east-1", "ap-southeast-2"]
}

resource "aws_dynamodb_table" "table" {
  name             = "database"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "id"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "creationDate"
    type = "S"
  }

  ttl {
    attribute_name = "expirationTime"
    enabled        = true
  }

  global_secondary_index {
    name            = "dateIndex"
    hash_key        = "creationDate"
    projection_type = "ALL"
  }

  dynamic "replica" {
    for_each = local.regions
    content {
      region_name = replica.value
    }
  }

  tags = local.database_tags
}

```
