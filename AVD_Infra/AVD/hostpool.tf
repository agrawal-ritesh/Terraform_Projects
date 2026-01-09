resource "azurerm_virtual_desktop_host_pool" "hostpool" {
    name = var.hostpool_name
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name

    type ="Pooled"
    load_balancer_type = "BreadthFirst"
    maximum_sessions_allowed = 10

    friendly_name = "Terraform Pooled AVD HostPool"
}