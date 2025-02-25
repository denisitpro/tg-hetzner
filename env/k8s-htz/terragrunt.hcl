include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/tf-modules/k8s-htz"
}

inputs = {
  CF_API_RW_TOKEN = get_env("CF_API_RW_TOKEN")
  HTZ_TOKEN = get_env("HTZ_TOKEN")
}
