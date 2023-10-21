<<<<<<< HEAD
resource "azurerm_availability_set" "avset"{
    name = "availability_set"
    location = "East US"
    resource_group_name = azurerm_resource_group.resgrp.name
=======
resource "azurerm_resource_group" "resgrp" {
    name = "${var.prefix}resource"
    location = local.location
>>>>>>> c58545eafa91c73d55baf436d8959a20aa84280c
}