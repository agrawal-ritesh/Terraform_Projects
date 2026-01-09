terraform {
    backend "azurerm" {
        resource_group_name = "tfstate-rg"
        storage_account_name = "tfstateavdprod"
        container_name = "tfstate"
        key = "avd.tfstate"
    }
}