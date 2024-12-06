variable "vpc_id" {
  description = "VPC ID for the route table"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the route"
  type        = string
}

variable "gateway_id" {
  description = "Gateway ID for the route (e.g., Internet Gateway)"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}
