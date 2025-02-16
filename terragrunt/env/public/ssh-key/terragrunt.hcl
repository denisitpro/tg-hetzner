terraform {
  source = "${get_repo_root()}/tf-modules/hetzner-ssh-key"
}

inputs = {
  ssh_key_name = "main-ssh-key"
  public_key   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7MRK0SR14QnaopknO/V74zRhlZpbHCX8vefJg1nQha den@pub"
}