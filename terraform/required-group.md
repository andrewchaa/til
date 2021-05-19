# required-group  

It's a new block that terraform with version over 0.13 requires.

```terraform
terraform {
  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate20081"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

```
