# Cosmos DB Indexing

> Every resource within an Azure Cosmos DB database account needs to have a unique identifier. 
> Unlike ResourceId, which is set internally, this [Id](https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.documents.resource.id?view=azure-dotnet) is settable by the user and is not immutable. 
> When working with document resources, they too have this settable Id property. 
> If an Id is not supplied by the user the SDK will automatically generate a new GUID and assign 
> its value to this property before persisting the document in the database

Terraforming the indexing policy

```terraform
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
      path = "/name"
    }

    excluded_path {
      path = "/*"
    }
  }
}
```

Include / exclude precedence

https://docs.microsoft.com/en-us/azure/cosmos-db/index-policy

* Included Path: /food/ingredients/nutrition/*
* Excluded Path: /food/ingredients/*

In this case, the included path takes precedence over the excluded path because it is more precise. 
Based on these paths, any data in the food/ingredients path or nested within would be 
excluded from the index. The exception would be data within the included path: `/food/ingredients/nutrition/*`, 
which would be indexed

