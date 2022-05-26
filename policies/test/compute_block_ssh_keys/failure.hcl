mock "tfplan/v2" {
  module {
    source = "../../testdata/compute_block_ssh_keys/mock-tfplan-failure.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}