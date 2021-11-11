# Getting started with terragrunt

https://terragrunt.gruntwork.io/docs/getting-started/quick-start/

Install Terragrunt

    brew install terragrunt
    
Put your Terragrunt configuration in a `terragrunt.hcl` file

```hcl
terraform {
    source = "."

    extra_arguments "custom_vars" {
        commands = get_terraform_commands_that_need_vars()

        required_var_files = [
            "${get_parent_terragrunt_dir()}/inputs.tfvars"
        ]

        optional_var_files = [
            "${get_parent_terragrunt_dir()}/inputs.${get_env("ENVIRONMENT_TYPE", "")}.tfvars"
        ]
    }
}

include {
    path = "${find_in_parent_folders("state-regional.hcl")}"
}
```


Use `terragrunt`

    terragrunt plan
    terragrunt apply
    terragrunt output
    terragrunt destroy
