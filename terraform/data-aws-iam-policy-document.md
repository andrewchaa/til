# Data Source: aws_iam_policy_document

> Generates an IAM policy document in JSON format for use with resources that expect policy documents such as aws_iam_policy.
> Using this data source to generate policy documents is optional. It is also valid 
> to use literal JSON strings in your configuration or to use the file interpolation function to read a raw JSON policy document from a file.

```terraform
data "aws_iam_policy_document" "deliveries_table" {
  version = "2012-10-17"

  statement {
    actions = [
      "dynamodb:*",
    ]

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.table_name}*"
    ]
  }
}

```
