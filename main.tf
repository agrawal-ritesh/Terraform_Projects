resource "azurerm_resource_group" "resgrp" {
    name = "${var.prefix}resource"
    location = local.location
}