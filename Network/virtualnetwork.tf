terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.77.0"
    }
  }
}
provider "azurerm"{
    subscription_id = "6883dfc1-f1f6-41c4-a578-5dcbd9ef10e0"
    tenant_id ="a70bb139-71ea-4653-b99f-fc3ca97b02fe"
    features {}
}
#Defining variables for Network Security Group
variable "names"{
    description = "Name of the Network Security Group"
    type = string
    default = "netsecuritygrp"
}
#Defining variables for Virtual Network
variable "namenet"{
    description ="Name of Virtual Network"
    type = string
    default ="virnetwork"
}
#Defining the locals
locals {                                          
    location = "East US"
    resource_group_name = "netresgroup"
}
#creating the resource group
resource "azurerm_resource_group" "netresgrp"{
    name = local.resource_group_name
    location = local.location
}
#Deploying azure network security group
resource "azurerm_network_security_group" "netsec" {
    name = "${var.name}"
    location = local.location
    resource_group_name = local.resource_group_name
    depends_on = [azurerm_resource_group.netresgrp]
}
#Deploying azure Virtual Network
resource "azurerm_virtual_network" "vnet"{
    name = "${var.namenet}"
    location = local.location
    resource_group_name = local.resource_group_name
    address_space = ["10.0.0.0/16"]
    dns_servers = ["10.0.0.4", "10.0.0.5"]
#subnet
    subnet {
        name = "subnet1"
        address_prefix = "10.0.1.0/24"
    }
    subnet {
        name = "subnet2"
        address_prefix = "10.0.2.0/24"
    }
    depends_on = [azurerm_virtual_network.vnet]
}

