terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "c0b632e6-903f-41ca-ad23-b88acd65b7a7"
}

resource "azurerm_resource_group" "testrg" {
  name     = "apptestvnet"
  location = "East US"
}
resource "azurerm_virtual_network" "vnet" {
    name = "vnetUE"
    location = "East US"
    resource_group_name = azurerm_resource_group.testrg.name
    address_space = ["10.0.0.0/16"]

subnet {
    name = "subvnetue-1"
    address_prefixes = ["10.0.1.0/24"]
}
subnet {
    name = "subvnetue-2"
    address_prefixes = ["10.0.2.0/24"]
}
tags = {
    environment = "Prod"
}
}
