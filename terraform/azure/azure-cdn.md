# Azure CDN

```terraform
resource "azurerm_cdn_profile" "simplyweb" {
  name                = "${var.appname}-cdn"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.simplyweb.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "simplyweb_web" {
  name                = "simplyweb"
  profile_name        = azurerm_cdn_profile.simplyweb.name
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.simplyweb.name
  origin {
    name      = "web"
    host_name = var.hostname
  }

  origin_host_header = var.hostname
}
```
