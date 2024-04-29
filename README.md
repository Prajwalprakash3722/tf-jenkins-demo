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

## Thought Process
- Provision Infrastructure
- Install all Necessary softwares, but automate it (ansible)
- configure the proper config files but automate it

## Completed
- Automated infrastructure provisioning.
- Automated software installation using Ansible.
- Configuration of necessary software tools.
- Collection of metrics and implementation of visualization

## Pending:
- Learning query language for log analysis and visualization.
- Replace Docker with Actual Servers
## What all can this do?

Automatically can provision instances and also configure the necessary tools, can also even scale up or scale down without impacting the exising setup, ultilizes terraform, ansible idempotent quality.

Automatically can bring down all the instances.

Automatically backup loki storage to some S3 storage



> Why did I choose FluentBit?
<!-- TODO -->
