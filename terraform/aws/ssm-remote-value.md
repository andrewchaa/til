# Create SSM and populate the value with remote state's output

```
resource "aws_ssm_parameter" "api_client_id" {
  name        = "/${var.component_name}/api_client_id"
  description = "Scoped id for api client"
  type        = "SecureString"
  value       = data.terraform_remote_state.schema.outputs.client_id
  key_id      = aws_kms_key.general_purpose.key_id

  lifecycle {
    ignore_changes = [
      value,
    ]
  }
}

```
