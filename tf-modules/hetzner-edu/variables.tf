

variable "default_zone_name" {
  default = "beta-82.win"
}

# calculate dns zone

data "cloudflare_zones" "current_cf_zone_id" {
  name = var.default_zone_name
}

locals {
  current_cf_zone_id   = data.cloudflare_zones.current_cf_zone_id.result[0].id
  current_cf_zone_name = data.cloudflare_zones.current_cf_zone_id.result[0].name

}

output "current_cf_zone_id" {
  value = local.current_cf_zone_id
}

output "current_cf_zone_name" {
  value = local.current_cf_zone_name
}
