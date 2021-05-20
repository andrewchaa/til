# Blob storage for static website

You can host static website on Azure blob storage container.

Things to note

* Allow public access: `allow_blob_public_access = true`
* Enable static website: `static_website {}`
* The name of the container should be `$web`
* Set container access type to blob: `container_access_type = "blob"`

```terraform
resource "azurerm_storage_account" "wynwyn" {
  name                     = "wynwyn"
  resource_group_name      = azurerm_resource_group.wynwyn.name
  location                 = azurerm_resource_group.wynwyn.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

  static_website {
    index_document = "index.html"
  }
  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "wynwyn" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.wynwyn.name
  container_access_type = "blob"
}
```

