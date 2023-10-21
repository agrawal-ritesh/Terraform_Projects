resource "azurerm_resource_group" "resource" {
    name = "new${var.name}"
    location = "East US"
}