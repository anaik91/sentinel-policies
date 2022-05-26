mock "tfplan/v2" {
  module {
    source = "../../testdata/enable_network_private_google_access/mock-tfplan-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}