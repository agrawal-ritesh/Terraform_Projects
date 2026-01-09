resource "azurerm_network_interface" "nic" {
    for_each =local.session_hosts
    name = "${each.key}-nic"
    location = var.location 
    resource_group_name = azurerm_resource_group.rg.name
    
    ip_configuration {
        name = "ipconfig"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_windows_virtual_machine" "sessionhost" {
    for_each = local.session_hosts
    name = each.key
    location = var.location 
    resource_group_name = azurerm_resource_group.rg.name
    size = var.vm-size

    admin_username = var.vm_admin_username
    admin_password = var.vm_admin_password

    network_interface_ids = [
        azurerm_network_interface.nic[each.key].id
    ]
    os_disk {
        name = "${each.key}-osdisk"
        caching = "ReadWrite"
        storage_account_type = "Premium_LRS"
        disk_size_gb = 128
    }

    source_image_reference {
        publisher = "MicrosoftWindowsDesktop"
        offer = "window-11"
        sku = "win11-23h2-avd"
        version = "latest"
    }
}