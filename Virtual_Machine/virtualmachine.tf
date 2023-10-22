terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.77.0"
        }
    }
}
provider "azurerm" {
    subscription_id = "6883dfc1-f1f6-41c4-a578-5dcbd9ef10e0"
    tenant_id ="a70bb139-71ea-4653-b99f-fc3ca97b02fe"
    features {}
}
locals{
    location = "West US"
    source_group_name = "vmresgrp"
}
variable "vmname"{
    description = "Virtual Machine Name"
    type = string
    default = "vm"
}
variable "res" {
    description = "Resource group name"
    type = string
    default = "group"
}
resource "azurerm_resource_group" "resgrp"{
    name = "resoure${var.res}"
    location = local.location
}
resource "azurerm_vitual_network" "vnet"{
    name = "network${var.res}"
    resource_group_name = azurerm_resource_group.resgrp.name
    location = local.location
    address_space = [10.0.0.0/16]
    depends_on = [azurerm_resource_group.resgrp]
}
resource "azurerm_subnet" "subn"{
    name = "internal"
    resource_group_name = azurerm_resource_group.resgrp.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefix = ["10.0.2.0/24"]
    depends_on =[azurerm_virtual_network.vnet]
}
resource "azurerm_network_interface" "vnic" {
    name = "nic${var.res}"
    location = local.location
    resource_group_name = azurerm_resource_group.resgrp.name

    ip_configuration{
        name = "ipdemo1"
        subnet_id = azurerm_subnet.internal.id
        private_ip_address_allocation = "Dynamic"
        depends_on = [azurerm_subnet.subn]
    }
}
resource "azurerm_virtual_machine" "vm" {
    name = "vm${var.vmname}"
    location = local.location
    resource_group_name = azurerm_resource_group.resgrp.name
    network_interface_ids = [azurerm_network_interface.vnic.id]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}