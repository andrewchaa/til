# eventgrid

```terraform
resource "azurerm_eventgrid_topic" "contactus_requested_topic_dev" {
  name                = "contactus-requested-v1-dev"
  location            = azurerm_resource_group.simplyapi.location
  resource_group_name = azurerm_resource_group.simplyapi.name

  tags = {
    environment = "development"
  }
}

resource "azurerm_eventgrid_topic" "contactus_requested_topic_prod" {
  name                = "contactus-requested-v1-prod"
  location            = azurerm_resource_group.simplyapi_prod.location
  resource_group_name = azurerm_resource_group.simplyapi_prod.name

  tags = {
    environment = "production"
  }
}

```
