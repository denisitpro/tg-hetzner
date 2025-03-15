resource "hcloud_server" "k8s_worker" {
  count       = 3
  name        = "w-${format("%02d", count.index + 1)}"
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  ssh_keys = [
    hcloud_ssh_key.den_ssh_key.id
  ]
  user_data = templatefile("${path.module}/user_data/cloud-init.yaml.tftpl", {
    ssh_keys_list = local.ssh_keys_list
  })

  lifecycle {
    ignore_changes = [user_data, image]
  }

  backups = false

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}


