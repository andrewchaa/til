# Using `terraform-aws-modules/lambda/aws`

```terraform
# data.tf
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# iam-policy.tf
data "aws_iam_policy_document" "expense_table" {
  version = "2012-10-17"

  statement {
    actions = [
      "dynamodb:*",
    ]

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.component_name}-expense*"
    ]
  }
}

# variables.tf
variable "environment_name" {}
variable "component_name" {}
variable "resource_tags" {
    type = map(string)
}
variable "log_level" {}

# resource-lambda.tf
module "lambda_create_expense" {
  source = "terraform-aws-modules/lambda/aws"
  version = "~> 2.0"

  function_name = "${var.component_name}-create-expense"
  role_name     = "${var.component_name}-create-expense-${data.aws_region.current.name}"
  description   = "Create expense"
  handler       = "Expenses.Api::Expenses.Api.Functions.CreateExpenseFunction::Execute"
  memory_size   = 512
  timeout       = 15
  runtime       = local.rest_lambda_runtime
  cloudwatch_logs_retention_in_days = 7
  create_current_version_allowed_triggers = false # This will allow adding policies, otherwise we need `publish = true`
  kms_key_arn   = aws_kms_key.general_purpose.arn

  environment_variables = merge(
    local.logging_environment_variables,
  )

  attach_policy_jsons = true
  number_of_policy_jsons = 1
  policy_jsons = [
    data.aws_iam_policy_document.expense_table.json
  ]

  create_package = false
  local_existing_package = var.package_file_path
  tags = var.resource_tags
}


```
