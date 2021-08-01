# Provision Cosmos DB

Create account

```terraform
resource "azurerm_cosmosdb_account" "db" {
  name                = "showmethemoney"
  location            = azurerm_resource_group.showmethemoney.location
  resource_group_name = azurerm_resource_group.showmethemoney.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level = "Eventual"
  }

  geo_location {
    location          = azurerm_resource_group.showmethemoney.location
    failover_priority = 0
  }
}
```
