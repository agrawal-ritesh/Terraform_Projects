terraform {
    required_providers {
        azurerm = {
            source ="hashicorp/azurerm"
            version = "3.77.0"
        }
    }
}
provider "azurerm" {
    subscription_id = "6883dfc1-f1f6-41c4-a578-5dcbd9ef10e0"
    tenant_id ="a70bb139-71ea-4653-b99f-fc3ca97b02fe"
    features {}
}