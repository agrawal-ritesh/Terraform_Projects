resource "azurerm_availability_set" "avset"{
    name = "availability_set"
    location = "East US"
    resource_group_name = azurerm_resource_group.resgrp.name
}