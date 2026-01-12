variable location {
    default = "East US"
}

variable vm_count {
    default = 5
}

variable rg_name {
    default = "instance_rg"
}
variable vm_size {
    default = "Standard_d2s_v5"
}
variable "admin_username"{}
variable "admin_password" {
    sensitive = true
}
variable "vnet_cidr"{
    default = "10.20.0.0/16"
}
variable "subnet_cidr" {
    default = "10.20.1.0/24"
}
