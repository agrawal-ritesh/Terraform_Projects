output "hostpool_name" {
    value = azurerm_virtual_desktop_host_pool.hostpool.friendly_name
}

output  "session_hosts" {
    value = keys(local.session_hosts)
}

output "fslogix_share" {
    value = azurerm_storage_share.profiles.name
}