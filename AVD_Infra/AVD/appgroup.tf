resource "azurerm_virtual_desktop_application_group" "dag" {
    name = "avd-desktop-ag"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name

    type = "Desktop"
    host_pool_id = azurerm_virtual_desktop_host_pool.hostpool.id
}

resource "azurerm_virtual_desktop_workspace" "workspace" {
    name = "avd-workspace"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_desktop_application_group_association" "assoc" {
    workspace_id = azurerm_virtual_desktop_workspace.workspace.id
    application_group_id = azurerm_virtual_desktop_application_group.dag.id
}

resource "azurerm_role_assignment" "user_assignment" {
    scope = azurerm_virtual_desktop_application_group.dag.id
    role_definition_name = "Desktop Virtual User"
    principal_id = var.aad_user_object_id
}