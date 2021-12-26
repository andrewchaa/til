# Simple function app

```terraform
resource "azurerm_function_app" "simplyapi_prod" {
  name                       = "${var.appname}-prod"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.simplyapi.name
  app_service_plan_id        = azurerm_app_service_plan.simplyapi.id
  storage_account_name       = azurerm_storage_account.simplyapi.name
  storage_account_access_key = azurerm_storage_account.simplyapi.primary_access_key
  os_type                    = "linux"
  version                    = "~3"

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"       = "",
    "FUNCTIONS_WORKER_RUNTIME"       = "node",
    "is_production"                  = "true",
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.simplyapi.instrumentation_key
  }

  connection_string {
    name  = "COSMOSDB_CONNECTION_STRING"
    type  = "DocDb"
    value = azurerm_cosmosdb_account.simplyapiprod.connection_strings[0]
  }

  site_config {
    cors {
      allowed_origins = ["https://www.sekyee.co.uk"]
    }
  }
}

resource "azurerm_application_insights" "simplyapi" {
  name                = "${var.appname}-prod-insights"
  location            = var.location
  resource_group_name = azurerm_resource_group.simplyapi.name
  application_type    = "web"
  tags = {
    environment = "production"
  }
}


```
