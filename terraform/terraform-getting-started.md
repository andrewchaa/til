# Terraform Getting Started

Install Terraform

    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform

### File structure

* provider.tf
* variables.tf
* your-resource.tf

```terraform
# provider.tf

terraform {
  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate20081"
    container_name       = "tstate"
    key                  = "sekyee.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

```

### Conventions

It's handy to use app name + environment

```terraform
resource "azurerm_cosmosdb_sql_database" "cdb" {
  name                = "${var.appname}-${var.environment}"
  resource_group_name = data.azurerm_cosmosdb_account.cda.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.cda.name
  throughput          = 400
}
```


### String Templates

Interpolation

```terraform
"Hello, ${var.name}"
```

Directives

```terraform
"Hello, %{ if var.name != "" }${var.name}%{ else }unnamed%{ endif }!"

<<EOT
%{ for ip in aws_instance.example.*.private_ip }
server ${ip}
%{ endfor }
EOT
```

Whitespace Stripping

```terraform
<<EOT
%{ for ip in aws_instance.example.*.private_ip ~}
server ${ip}
%{ endfor ~}
EOT
```
