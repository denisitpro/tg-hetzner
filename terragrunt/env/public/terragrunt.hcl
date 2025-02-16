terraform {
  source = "${get_repo_root()}/tf-modules/hetzner-edu"
}

inputs = {
  server_name = "web-dev"
}