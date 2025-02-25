variable "HTZ_TOKEN" {
  type      = string
  sensitive = true
}

variable "CF_API_RW_TOKEN" {
  type      = string
  sensitive = true
}

variable "ssh_keys_map" {
  type = map(string)

}