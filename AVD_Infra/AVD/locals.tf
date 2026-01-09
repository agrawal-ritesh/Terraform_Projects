locals {
    prefix = "avdprod"

    session_hosts = {
        for i in range (var.session_host_count):
        "${local.prefix}-sh-${i+1}" =>1
    }
}