
resource "hcloud_ssh_key" "main_ssh_key" {
  name       = var.ssh_key_name
  public_key = var.public_key
}