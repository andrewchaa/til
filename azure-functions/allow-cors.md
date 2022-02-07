# Allow CORS for HTTP Triger

https://www.c-sharpcorner.com/article/handling-cors-in-azure-function/

```terraform
resource "azurerm_function_app" "simplyapi_prod" {
  name                       = "${var.appname}-prod"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.simplyapi_prod.name
  app_service_plan_id        = azurerm_app_service_plan.simplyapi_prod.id
  storage_account_name       = azurerm_storage_account.simplyapi_prod.name
  storage_account_access_key = azurerm_storage_account.simplyapi_prod.primary_access_key
  os_type                    = "linux"
  version                    = "~3"

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"       = "",
    "FUNCTIONS_WORKER_RUNTIME"       = "node",
    "is_production"                  = "true",
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.simplyapi_prod.instrumentation_key
  }

  connection_string {
    name  = "SIMPLYAPI"
    type  = "DocDb"
    value = azurerm_cosmosdb_account.simplyapiprod.connection_strings[0]
  }

  site_config {
    cors {
      allowed_origins = ["https://www.sekyee.co.uk"]
    }
  }
}

```
