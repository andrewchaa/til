# Terragrunt input vars

Set `var.log_level` from the pipeline

inputs.dev.tfvars

```hcl
log_level = "Information"
```

```hcl
terraform {
  source = "."

  extra_arguments "custom_vars" {
    commands = get_terraform_commands_that_need_vars()

    required_var_files = [
      "${get_parent_terragrunt_dir()}/inputs.tfvars",
      "${get_parent_terragrunt_dir()}/inputs.${get_env("MNPG_ENVIRONMENT_TYPE")}.tfvars"
    ]
  }
}

include {
  path = "${find_in_parent_folders("state-regional.hcl")}"
}
```
