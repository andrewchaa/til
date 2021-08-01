# Provision Cosmos DB

They hierachy is 

* Account
* Database
* Container


Exclude all properties by setting exclude at the root directory and gradually add properties you want to index

```terraform
resource "azurerm_cosmosdb_account" "showmethemoney" {
  name                = var.appname
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

resource "azurerm_cosmosdb_sql_database" "showmethemoney" {
  name                = "${var.appname}-${var.environment}"
  resource_group_name = azurerm_cosmosdb_account.showmethemoney.resource_group_name
  account_name        = azurerm_cosmosdb_account.showmethemoney.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "companies" {
  name                  = "Companies"
  resource_group_name   = azurerm_cosmosdb_account.showmethemoney.resource_group_name
  account_name          = azurerm_cosmosdb_account.showmethemoney.name
  database_name         = azurerm_cosmosdb_sql_database.showmethemoney.name
  partition_key_path    = "/companyId"
  partition_key_version = 1
  throughput            = 400

  indexing_policy {
    indexing_mode = "Consistent"

    excluded_path {
      path = "/*"
    }
  }
}
```
