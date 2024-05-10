# Nginx Logs and System Metrics Analysis

## Tech Stack

- Infrastructure: Multipass
- Automating Infrastructure: Terraform
- Metrics Collector: Node Exporter
- Logs Collector: FluentBit
- Metrics Storage and Query: Prometheus
- Logs Storage and Query: Loki
- Dashboard: Grafana
- Automating the Tools: Ansible

## Features

- Automated Infrastructure Provisioning: Utilize Terraform to provision instances seamlessly on any cloud provider running Debian/Ubuntu.
- Software Installation Automation: Ansible automates the installation of necessary software tools.
- Configuration Management: Automatically configure all software tools for optimal performance.
- Scalability: Easily scale up or down the infrastructure without disrupting existing operations.
- Idempotent Quality: Ansible ensures consistent and predictable configuration management.
- Backup: Automatically backup Loki storage to an S3 storage. (not implemented as AWS does not algin with project requirements)

## How It Works

- Infrastructure Provisioning: Terraform provisions instances on Multipass according to defined specifications.
- Software Installation: Ansible automates the installation of Node Exporter, FluentBit, Prometheus, Loki, and Grafana on the provisioned instances.
- Configuration: Ansible ensures proper configuration of all software tools for seamless operation.
- Metrics Collection: Node Exporter collects system metrics.
- Logs Collection: FluentBit collects Metrics & Nginx logs and forwards them to Loki for storage and querying.
- Visualization: Grafana provides intuitive dashboards for visualizing both system metrics and Nginx logs.

## Usage

- Provision Infrastructure: Run Terraform scripts to provision instances.
- Install Software: Execute Ansible playbooks to automate the installation of necessary software tools.
- Configure Tools: Ensure proper configuration of all software components.
- Monitor and Analyze: Utilize Grafana dashboards to monitor system metrics and analyze Nginx logs effectively.

## License
This project is licensed under the MIT License.
