# Provisioning Azure Functions with Terraform

### linux, consumption (serverless) plan

`app_settings` is very important

```terraform
resource "azurerm_app_service_plan" "showmethemoney" {
  name                = "showmethemoney"
  location            = var.location
  resource_group_name = azurerm_resource_group.showmethemoney.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "showmethemoney" {
  name                       = "showmethemoney"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.showmethemoney.name
  app_service_plan_id        = azurerm_app_service_plan.showmethemoney.id
  storage_account_name       = azurerm_storage_account.showmethemoney.name
  storage_account_access_key = azurerm_storage_account.showmethemoney.primary_access_key
  os_type                    = "linux"
  version                    = "~3"

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.showmethemoney.instrumentation_key
    "FUNCTIONS_WORKER_RUNTIME"       = "dotnet"
    "FUNCTIONS_EXTENSION_VERSION"    = "-3"
  }
}

```

### App servier plan

```terraform
resource "azurerm_app_service_plan" "wynwyn" {
  name                = "azure-functions-service-plan"
  location            = azurerm_resource_group.wynwyn.location
  resource_group_name = azurerm_resource_group.wynwyn.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_function_app" "wynwyn" {
  name                       = "wynwyn-functions"
  location                   = azurerm_resource_group.wynwyn.location
  resource_group_name        = azurerm_resource_group.wynwyn.name
  app_service_plan_id        = azurerm_app_service_plan.wynwyn.id
  storage_account_name       = azurerm_storage_account.wynwyn.name
  storage_account_access_key = azurerm_storage_account.wynwyn.primary_access_key
  os_type                    = "linux"
  site_config {
    always_on = true
  }

}
```

* Please refer to [Azure App Service Plan Pricing](https://azure.microsoft.com/en-gb/pricing/details/app-service/linux/) for sku
* Free tier is not available for C# runtime (https://docs.microsoft.com/en-us/answers/questions/148581/i-get-error-when-trying-to-create-azure-function-f.html)
* Make sure `alwsys_on` is set to `true`. Otherwise, the instance wouldn't be ready when you deploy and the CI will most of the time fail.

