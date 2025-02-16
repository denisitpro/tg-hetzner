# general settings
# terraform {
# }

terraform {
  before_hook "apply_dependencies" {
    commands = ["apply"]
    execute = ["terragrunt", "run-all", "apply", "--terragrunt-non-interactive", "--terragrunt-exclude-dir", "."]
  }

  before_hook "plan_dependencies" {
    commands = ["plan"]
    execute = ["terragrunt", "run-all", "apply", "--terragrunt-non-interactive", "--terragrunt-exclude-dir", "."]
  }

  source = "${get_repo_root()}/tf-modules/hetzner-edu"
}

# inputs = {
#   ssh_key_name = "main-ssh-key"
# }

# variable "den_public_key" {
#   default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7MRK0SR14QnaopknO/V74zRhlZpbHCX8vefJg1nQha den@pub"
# }

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