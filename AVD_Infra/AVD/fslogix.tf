resource "random_integer" "rand" {
  min = 1000
  max = 9999
}

resource "azurerm_storage_account" "fslogix" {
  name                     = "fslogix${random_integer.rand.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"
}

resource "azurerm_storage_share" "profiles" {
  name                 = "fslogix-profiles"
  storage_account_id = azurerm_storage_account.fslogix.name
  quota                = 1024

  depends_on = [
    azurerm_storage_account.fslogix
  ]
}
 