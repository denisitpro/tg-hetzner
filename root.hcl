# general settings
terraform {
  source = "./tf-modules/hetzner-edu"
}

inputs = {
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
}

# remote_state {
#   backend = "s3"
#   config = {
#     bucket         = "my-terraform-state"
#     key            = "hcloud/${path_relative_to_include()}/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }