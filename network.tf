resource "azurerm_resource_group" "rg"{
    name = var.rg_name
    location = var.location
}
resource "azurerm_virtual_network" "vnet"{
    name = "${local.prefix}-vnet"
    address_space = [var.vnet_cidr]
    location = var.location
    resource_group_name = var.rg_name
}
resource "azurerm_subnet" "subnet"{
    name = "vm-subnet"
    resource_group_name = var.rg_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [var.subnet_cidr]

    depends_on =[azurerm_virtual_network.vnet]
}
