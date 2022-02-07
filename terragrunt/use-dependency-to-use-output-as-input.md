# Use output of a module as input to another module

```terraform
dependency "api_key" {
  config_path = "../api-key"
}

inputs = {
  api_key = dependency.api_key.outputs.api_key
  resource_tags = local.resource_tags
}

```
