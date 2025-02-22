
dependency "ssh_key" {
  config_path = "./ssh-key"
  mock_outputs_merge_with_state = true
  mock_outputs = {
    ssh_key_id = "mock-ssh-key-id"
  }
  # skip_outputs = false


  # mock_outputs = {
  #     ssh-key_output = "mock-ssh-key-output"
  # }
}

dependencies {
  paths = ["./ssh-key"]

}

terraform {
  source = "${get_repo_root()}/tf-modules/hetzner-edu"
}

inputs = {
  CF_API_RW_TOKEN = get_env("CF_API_RW_TOKEN")
  HTZ_TOKEN = get_env("HTZ_TOKEN")
  ssh_key_id = dependency.ssh_key.outputs.ssh_key_id
}
