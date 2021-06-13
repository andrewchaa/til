# Create Azure API Management

```terraform
resource "azurerm_api_management" "wynwyn" {
  name                = "wynwyn-apim"
  location            = azurerm_resource_group.wynwyn.location
  resource_group_name = azurerm_resource_group.wynwyn.name
  publisher_name      = "Deepeyes"
  publisher_email     = "deepeyes@terraform.io"

  sku_name = "Consumption_0"

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML

  }
}
```
