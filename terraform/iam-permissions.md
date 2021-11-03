# IAM permissions

```terraform
data "aws_iam_policy_document" "dynamodb" {
  statement {
    effect    = "Allow"
    actions   = [
      "dynamodb:PutItem",
      "dynamodb:Get*",
      "dynamodb:Query",
      "dynamodb:DescribeTable"
    ]
    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/credits-database*"
    ]
  }
}

resource "aws_iam_policy" "dynamodb_role_policy" {
  name = "${var.component_name}-dynamodb-${data.aws_region.current.name}"
  description = "Dynamodb policy for ${var.component_name}"
  policy = data.aws_iam_policy_document.dynamodb.json
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_attach" {
  role = aws_iam_role.iam_role_lambda.name
  policy_arn = aws_iam_policy.dynamodb_role_policy.arn
}
```
