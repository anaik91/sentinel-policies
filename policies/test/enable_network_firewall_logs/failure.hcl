mock "tfplan/v2" {
  module {
    source = "../../testdata/enable_network_firewall_logs/mock-tfplan-failure.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}