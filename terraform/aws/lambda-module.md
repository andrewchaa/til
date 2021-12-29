# lambda module

```terraform
module "lambda_handle_customer_created_primary" {
  source = "terraform-aws-modules/lambda/aws"
  version = "~> 2.0"

  function_name = "${var.component_name}-handle-customer-created"
  role_name     = "${var.component_name}-handle-customer-created"
  description   = "Handle customer created event"
  handler       = "Customers.Api::Customers.Api.Functions.HandleCustomerCreatedFunction::Execute"
  memory_size   = 512
  timeout       = 15
  runtime       = local.rest_lambda_runtime
  cloudwatch_logs_retention_in_days = 7
  create_current_version_allowed_triggers = false # This will allow adding policies, otherwise we need `publish = true`
  kms_key_arn   = aws_kms_key.primary.arn

  environment_variables = merge(
    local.logging_environment_variables,
  )

  attach_policy_jsons = true
  number_of_policy_jsons = 2
  policy_jsons = [
    data.aws_iam_policy_document.kms.json,
    data.aws_iam_policy_document.contacts_table.json
  ]

  attach_policy_statements = true
  policy_statements = {
    sqs_failure = {
      effect    = "Allow",
      actions   = ["sqs:SendMessage"],
      resources = [aws_sqs_queue.customer_created_deadletter_primary.arn]
    },
    sqs_trigger = {
      effect = "Allow",
      actions = [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage",
        "sqs:GetQueueAttributes",
        "sqs:ChangeMessageVisibility"
      ],
      resources = [aws_sqs_queue.customer_created_primary.arn]
    }
  }


  allowed_triggers = {
    sqs = {
      principal  = "sqs.amazonaws.com"
      source_arn = aws_sqs_queue.customer_created_primary.arn
    }
  }

  event_source_mapping = {
    sqs = {
      event_source_arn = aws_sqs_queue.customer_created_primary.arn
      batch_size       = 1
    }
  }

  create_package = false
  local_existing_package = var.package_file_path
  tags = var.resource_tags
}

```
