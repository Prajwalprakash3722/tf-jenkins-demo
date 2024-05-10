terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "1.4.2"
    }
  }
}

provider "multipass" {
  alias = "nginx_logging_analysis"
}

resource "multipass_instance" "node" {
  count          = var.no_of_nodes
  name           = "node-${count.index + 5}"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = var.node_cpu
  image          = var.release
  memory         = "${var.node_memory}MiB"
}
