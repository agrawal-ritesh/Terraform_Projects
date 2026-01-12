locals {
    prefix = "instance"
    vms = {
        for i in range (var.vm_count):
        "${local.prefix}-${i+1}" => i 
    }
}