mock "tfplan/v2" {
  module {
    source = "../../testdata/enable_single_user_only_notebook/mock-tfplan-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}