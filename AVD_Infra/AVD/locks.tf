resource "azurerm_managment_lock" "vm-lock" {
    for_each = azurerm_windows_virtual_machine.sessionhost
    name = "${each.key}-lock"
    scope = each.value.id
    lock_level = "CanNotDelete"
}

