resource "azurerm_resource_group" "resgrp" {
    name = "new${var.name}"
    location = "East US"
}