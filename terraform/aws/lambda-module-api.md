# provision api lambda with module

```terraform
module "lambda" {
  source = "terraform-aws-modules/lambda/aws"
  version = "~> 2.0"

  function_name = local.function_name
  role_name     = "${local.function_name}-lambda-${data.aws_region.current.name}"
  local_existing_package = "${var.artifacts_directory}/${var.module_name}.zip"
  handler       = local.handler
  memory_size   = local.memory_size
  timeout       = local.timeout
  runtime       = "dotnet6"
  cloudwatch_logs_retention_in_days = 7
  create_current_version_allowed_triggers = false # This will allow adding policies, otherwise we need `publish = true`

  environment_variables = local.environment_variables

  attach_policy_jsons = true
  number_of_policy_jsons = length(local.policies)
  policy_jsons = local.policies

  create_package = false

  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = local.api_integration_source_arn
    }
  }

  depends_on = [local.dependencies]
}

locals {
  api_integration_source_arn = "arn:aws:execute-api:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*/*/*/*"
  function_name = var.component_name
  handler = "Payments.Capture::Payments.Capture.Function::FunctionHandler"
  memory_size = 1028
  timeout = 30
  policies = [
    data.aws_iam_policy_document.lambda_queue_policy_data.json,
    data.aws_iam_policy_document.lambda_sqs_policy_document.json,
    data.aws_iam_policy_document.parameters.json
  ]
  environment_variables = {
    component_name = var.component_name,
    log_level = var.log_level,
    number_of_days_to_retry_capture = var.number_of_days_to_retry_capture,
    maximum_message_delay_in_seconds = var.maximum_message_delay_in_seconds
  }
  dependencies = [
    aws_ssm_parameter.launch_darkly_sdk_key,
    aws_ssm_parameter.api_client_id,
    aws_ssm_parameter.api_client_secret,    
  ]
}

```
