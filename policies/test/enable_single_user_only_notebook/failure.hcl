mock "tfplan/v2" {
  module {
    source = "../../testdata/enable_single_user_only_notebook/mock-tfplan-failure.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}