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

resource "multipass_instance" "loki" {
  name           = "loki"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = 4 
  image          = "lts"
  disk           = "10Gib"
  memory         = "2Gib"
}

resource "multipass_instance" "prometheus" {
  name           = "prometheus"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = 2
  image          = "jammy"
  disk           = "10Gib"
  memory         = "2Gib"
}

resource "multipass_instance" "grafana" {
  name           = "grafana"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = 1
  image          = "jammy"
  disk           = "10Gib"
  memory         = "2Gib"
}
resource "multipass_instance" "node" {
  count          = var.no_of_nodes
  name           = "node-${count.index + 1}"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = var.node_cpu
  image          = var.release
  memory         = "${var.node_memory}MiB"
}

# data "multipass_instance" "node_ip" {
#   for_each = toset([for instance in multipass_instance.node : instance.name])
#   name     = each.key
# }

# output "ipv4" {
#   value = { for instance_name, instance_data in data.multipass_instance.node_ip : instance_name => instance_data.ipv4 }
# }
