variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "ingress_from_port" {
  description = "Starting port for ingress rules"
  type        = number
}

variable "ingress_to_port" {
  description = "Ending port for ingress rules"
  type        = number
}

variable "ingress_protocol" {
  description = "Protocol for ingress rules"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks for ingress rules"
  type        = list(string)
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}
