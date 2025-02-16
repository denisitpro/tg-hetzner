output "ssh_key_id" {
  description = "ID ssh key"
  value       = hcloud_ssh_key.main_ssh_key.id
}