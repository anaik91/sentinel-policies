policy "compute_block_ssh_keys" {
    source = "./compute_block_ssh_keys.sentinel"
    enforcement_level = "soft-mandatory"
}

policy "enable_network_firewall_logs" {
    source = "./enable_network_firewall_logs.sentinel"
    enforcement_level = "soft-mandatory"
}

policy "enable_network_flow_logs" {
    source = "./enable_network_flow_logs.sentinel"
    enforcement_level = "soft-mandatory"
}

policy "enable_network_private_google_access" {
    source = "./enable_network_private_google_access.sentinel"
    enforcement_level = "soft-mandatory"
}