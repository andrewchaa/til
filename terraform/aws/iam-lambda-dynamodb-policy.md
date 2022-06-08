# IAM permissions

```terraform
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "iam_lambda_role_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_lambda_role" {
  name               = "${var.component}_${var.environment}_iam_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.iam_lambda_role_document.json
}

data "aws_iam_policy_document" "iam_lambda_dynamodb_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:PutItem",
      "dynamodb:Get*",
      "dynamodb:Query",
      "dynamodb:DescribeTable"
    ]
    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/registrations"
    ]
  }
}

resource "aws_iam_policy" "iam_lambda_dynamodb_policy" {
  name   = "${var.component}_${var.environment}_iam_lambda_dynamodb_policy"
  policy = data.aws_iam_policy_document.iam_lambda_dynamodb_policy_document.json
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_policy_attachment" {
  role       = aws_iam_role.iam_lambda_role.name
  policy_arn = aws_iam_policy.iam_lambda_dynamodb_policy.arn
}

```
