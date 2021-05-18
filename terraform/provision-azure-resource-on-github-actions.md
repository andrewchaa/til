# Provisioning Azure resources with Github actions

Github actions come free with the repository and has a lot of useful ready-made actions. 

`./github/workflows/terraform.yml`

```yaml
name: 'Terraform'
on:
  push:
    branches:
      - main
  pull_request:
jobs:
  terraform:
    name: 'Terraform'
    defaults:
      run:
        working-directory: "./terraform"
    env:
      ARM_CLIENT_ID: ${{ secrets.AZURE_AD_CLIENT_ID }}
      ARM_CLIENT_SECRET: ${{ secrets.AZURE_AD_CLIENT_SECRET }}
      ARM_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
      ARM_TENANT_ID: ${{ secrets.AZURE_AD_TENANT_ID }}
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1
      - name: Terraform Format
        id: fmt
        run: terraform fmt -check
      - name: Terraform Init
        id: init
        run: terraform init
      - name: Terraform Plan
        id: plan
        run: terraform plan -no-color
        continue-on-error: true
      - name: Terraform Plan Status
        if: steps.plan.outcome == 'failure'
        run: exit 1
      - name: Terraform Apply
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        run: terraform apply -auto-approve
```

## Provision Azure App Service

```terraform
variable "location" {
  type    = string
  default = "UK South"
}

variable "environment" {
  type    = string
  default = "production"
}

resource "azurerm_resource_group" "wynwyn-appservice-rg" {
  name     = "wynwyn-appservice-rg"
  location = var.location
  tags = {
    environment = var.environment
  }
}

resource "azurerm_app_service_plan" "wynwyn-service-plan" {
  name                = "wynwyn-service-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.wynwyn-appservice-rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
  tags = {
    environment = var.environment
  }
}

resource "azurerm_app_service" "wynwyn-app-service" {
  name                = "wynwyn-app-service"
  location            = var.location
  resource_group_name = azurerm_resource_group.wynwyn-appservice-rg.name
  app_service_plan_id = azurerm_app_service_plan.wynwyn-service-plan.id
  tags = {
    environment = var.environment
  }
}

```
