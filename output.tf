output "vm_name" {
    value = keys(azurerm_windows_virtual_machine.vms)
}