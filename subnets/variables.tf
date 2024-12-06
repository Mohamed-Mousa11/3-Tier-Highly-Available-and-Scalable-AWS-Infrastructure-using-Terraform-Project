variable "vpc_id" {
  description = "VPC ID"
}

variable "cidr_blocks" {
  type = object({
    public_subnets  = list(string)
    private_subnets = list(string)
  })
  description = "CIDR blocks for public and private subnets"
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}

variable "project_name" {
  description = "Project name for tagging"
}
