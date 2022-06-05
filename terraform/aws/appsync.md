# AppSync example

```terraform
# config.tf
terraform {
  backend "s3" {
    bucket = "workboard"
    key    = "terraform-state-dev"
    region = "eu-west-1"
  }
  required_version = "~>1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# provider.tf
provider "aws" {
  region = "eu-west-1"
}

# variables.tf
variable "component" {
  default = "workboard"
}

variable "environment" {
  default = "dev"
}


# iam.tf
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

data "aws_iam_policy_document" "iam_appsync_role_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["appsync.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_appsync_role" {
  name               = "${var.component}_${var.environment}_iam_appsync_role"
  assume_role_policy = data.aws_iam_policy_document.iam_appsync_role_document.json
}

data "aws_iam_policy_document" "iam_invoke_lambda_policy_document" {
  statement {
    actions   = ["lambda:InvokeFunction"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "iam_invoke_lambda_policy" {
  name   = "${var.component}_${var.environment}_iam_invoke_lambda_policy"
  policy = data.aws_iam_policy_document.iam_invoke_lambda_policy_document.json
}

resource "aws_iam_role_policy_attachment" "appsync_invoke_lambda" {
  role       = aws_iam_role.iam_appsync_role.name
  policy_arn = aws_iam_policy.iam_invoke_lambda_policy.arn
}

data "aws_iam_policy_document" "iam_lambda_log_policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_policy" "iam_lambda_log_policy" {
  name   = "${var.component}_${var.environment}_iam_lambda_log_policy"
  policy = data.aws_iam_policy_document.iam_lambda_log_policy_document.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_lambda_role.name
  policy_arn = aws_iam_policy.iam_lambda_log_policy.arn
}

# appsync.tf
resource "aws_appsync_graphql_api" "appsync" {
  name                = "${var.component}_${var.environment}_appsync"
  schema              = file("../schema.graphql")
  authentication_type = "API_KEY"
}

resource "aws_appsync_api_key" "appsync_api_key" {
  api_id = aws_appsync_graphql_api.appsync.id
}

resource "aws_appsync_datasource" "list_jobs" {
  name             = "${var.component}_${var.environment}_list_jobs"
  api_id           = aws_appsync_graphql_api.appsync.id
  service_role_arn = aws_iam_role.iam_appsync_role.arn
  type             = "AWS_LAMBDA"
  lambda_config {
    function_arn = aws_lambda_function.list_jobs.arn
  }
}

resource "aws_appsync_resolver" "list_jobs_resolver" {
  api_id      = aws_appsync_graphql_api.appsync.id
  type        = "Query"
  field       = "listJobs"
  data_source = aws_appsync_datasource.list_jobs.name

  request_template  = file("../resolvers/request.vtl")
  response_template = file("../resolvers/response.vtl")
}

# lambda
data "archive_file" "list_jobs" {
  type        = "zip"
  source_dir  = "../src/list-jobs"
  output_path = "../src/list-jobs.zip"
}

resource "aws_lambda_function" "list_jobs" {
  function_name = "${var.component}_${var.environment}_list_jobs"
  filename      = data.archive_file.list_jobs.output_path

  runtime = "nodejs14.x"
  handler = "listJobs.handler"

  source_code_hash = data.archive_file.list_jobs.output_base64sha256
  role             = aws_iam_role.iam_lambda_role.arn
}

resource "aws_cloudwatch_log_group" "list_jobs" {
  name = "/aws/lambda/${aws_lambda_function.list_jobs.function_name}"

  retention_in_days = 30
}

```
