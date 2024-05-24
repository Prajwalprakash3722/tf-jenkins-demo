variable "no_of_nodes" {
  type        = number
  default     = 4
  description = "Total Number of Instances to be provisioned"
}

variable "release" {
  type        = string
  default     = "jammy"
  description = "Release of the Ubuntu"
}

variable "node_cpu" {
  type        = number
  default     = 1
  description = "CPU for Node"
}

variable "node_memory" {
  type        = number
  default     = 1024
  description = "RAM for Node"
}
