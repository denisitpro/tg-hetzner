resource "hcloud_ssh_key" "den_ssh_key" {
  name       = "main-ssh-key"
  public_key = var.ssh_keys_map.main_ssh_key
}

locals {
  ssh_keys_list = values(var.ssh_keys_map)
}