resource "azurerm_network_interface" "nic" {
    for_each = local.vms
    name = "${each.key}-nic"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
        name = "ip_config"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }
    depends_on =[azurerm_subnet.subnet]
}

# Create 5 VMs.

resource "azurerm_windows_virtual_machine" "vms"{
    for_each = local.vms
    name = each.key
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    size = var.vm_size

    admin_username = var.admin_username
    admin_password = var.admin_password

    network_interface_ids = [
        azurerm_network_interface.nic[each.key].id
    ]
    os_disk{
        name = "${each.key}-osdisk"
        caching = "ReadWrite"
        storage_account_type = "Premium_LRS"
        disk_size_gb = 128
    
    }
    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-Datacenter"
      version = "Latest"
    
    }
    depends_on = [azurerm_network_interface.nic]
}
