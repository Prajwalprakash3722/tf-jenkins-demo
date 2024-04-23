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

resource "multipass_instance" "elastic_search" {
  name           = "elasticsearch"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = 1
  image          = "jammy"
  disk           = "10Gib"
  memory         = "2Gib"
}

resource "multipass_instance" "prometheus" {
  name           = "prometheus"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = 1
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
  count          = 2
  name           = "node-${count.index}"
  cloudinit_file = "${path.module}/user_data.cfg"
  cpus           = 1
  image          = "jammy"
  memory         = "512Mib"
}
