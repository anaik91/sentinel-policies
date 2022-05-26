mock "tfplan/v2" {
  module {
    source = "../../testdata/enable_network_flow_logs/mock-tfplan-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}