# Provisioning Azure Functions with Terraform

### linux, consumption (serverless) plan

* `app_settings` is very important
* `FUNCTIONS_WORKER_RUNTIME`should set the runtime language, like `dotnet`
* `FUNCTIONS_EXTENSION_VERSION` should be the same value as `-3`
* `<forward-request />` to forward the request to the function
* `x-functions-key` let the APIM to access your function 

```terraform
resource "azurerm_api_management" "showmethemoney" {
  name                = "showmethemoney"
  location            = azurerm_resource_group.showmethemoney.location
  resource_group_name = azurerm_resource_group.showmethemoney.name
  publisher_name      = "Deepeyes"
  publisher_email     = "deepeyes@terraform.io"

  sku_name = "Consumption_0"

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend>
        <forward-request />
      </backend>
      <outbound />
      <on-error />
    </policies>
XML

  }
}

resource "azurerm_api_management_api" "invoice" {
  name                = "invoice"
  resource_group_name = azurerm_resource_group.showmethemoney.name
  api_management_name = azurerm_api_management.showmethemoney.name
  revision            = "1"
  display_name        = "Invoice"
  path                = "invoice"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_operation" "createinvoice" {
  operation_id        = "createinvoice"
  api_name            = azurerm_api_management_api.invoice.name
  api_management_name = azurerm_api_management.showmethemoney.name
  resource_group_name = azurerm_resource_group.showmethemoney.name
  display_name        = "Create Invoice"
  method              = "POST"
  url_template        = "/v1/invoices"
  description         = "Create Invoice"

  response {
    status_code = 201
  }
}

resource "azurerm_api_management_api_operation_policy" "createinvoice" {
  api_name            = azurerm_api_management_api.invoice.name
  api_management_name = azurerm_api_management.showmethemoney.name
  resource_group_name = azurerm_api_management.showmethemoney.resource_group_name
  operation_id        = azurerm_api_management_api_operation.createinvoice.operation_id

  xml_content = <<XML
<policies>
  <inbound>
    <set-backend-service id="apim-generated-policy" backend-id="${azurerm_api_management_backend.invoice.name}" />
  </inbound>
</policies>
XML

}

resource "azurerm_api_management_backend" "invoice" {
  name                = "invoice"
  resource_group_name = azurerm_resource_group.showmethemoney.name
  api_management_name = azurerm_api_management.showmethemoney.name
  protocol            = "http"
  url                 = "https://showmethemoney.azurewebsites.net/api"
  resource_id         = "https://management.azure.com${azurerm_function_app.showmethemoney.id}"

  credentials {
    header = {
      "x-functions-key" = "<< your key here >>"
    }

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

  site_config {
    cors {
      allowed_origins = ["https://www.sekyee.co.uk"]
    }
  }
}
```
