# Provision Cosmos DB

They hierachy is 

* Account
* Database
* Container


Exclude all properties by setting exclude at the root directory and gradually add properties you want to index

```terraform
# serverless capabilities
resource "azurerm_cosmosdb_account" "simplyapidev" {
  name                = "${var.appname}-dev"
  location            = var.location
  resource_group_name = azurerm_resource_group.simplyapi_dev.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level = "Eventual"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "simplyapidev" {
  name                = var.appname
  resource_group_name = azurerm_cosmosdb_account.simplyapidev.resource_group_name
  account_name        = azurerm_cosmosdb_account.simplyapidev.name
}

resource "azurerm_cosmosdb_sql_container" "eventsstoredev" {
  name                  = "events-store"
  resource_group_name   = azurerm_cosmosdb_account.simplyapidev.resource_group_name
  account_name          = azurerm_cosmosdb_account.simplyapidev.name
  database_name         = azurerm_cosmosdb_sql_database.simplyapidev.name
  partition_key_path    = "/tenant"
  partition_key_version = 1

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/name/?"
    }

    excluded_path {
      path = "/*"
    }
  }
}
```

```terraformresource "azurerm_cosmosdb_account" "simplyapiprod" {
  name                = "${var.appname}-prod"
  location            = var.location
  resource_group_name = azurerm_resource_group.simplyapi_prod.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level = "Eventual"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "simplyapiprod" {
  name                = var.appname
  resource_group_name = azurerm_cosmosdb_account.simplyapiprod.resource_group_name
  account_name        = azurerm_cosmosdb_account.simplyapiprod.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "eventsstoreprod" {
  name                  = "events-store"
  resource_group_name   = azurerm_cosmosdb_account.simplyapiprod.resource_group_name
  account_name          = azurerm_cosmosdb_account.simplyapiprod.name
  database_name         = azurerm_cosmosdb_sql_database.simplyapiprod.name
  partition_key_path    = "/tenant"
  partition_key_version = 1
  throughput            = 400

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/name/?"
    }

    excluded_path {
      path = "/*"
    }
  }
}

```
