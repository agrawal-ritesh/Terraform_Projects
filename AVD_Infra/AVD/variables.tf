variable "location" {
    default = "East US"
}
variable "resource_group_name" {
    default = "rg-avd-prod"
}
variable "vnet_cidr" {
    default = "10.20.0.0/16"
}
variable "subnet_cidr" {
    default = "10.20.1.0/24"
}
variable "hostpool_name" {
    default = "avd-pool-hp"
}
variable "vm-size" {
    default = "Standard_D4s_v5"
}
variable "session_host_count" {
    default = 2
}
variable "vm_admin_username" {}

variable "vm_admin_password" {
    sensitive = true
}

variable "aad_user_object_id" {
    description = "AAD Object ID of user to assign AVD"
}
