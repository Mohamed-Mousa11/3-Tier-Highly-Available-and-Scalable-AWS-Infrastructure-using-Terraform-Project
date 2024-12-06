variable "allocated_storage" {
  description = "Allocated storage for the RDS instance (in GB)"
  type        = number
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "engine" {
  description = "Database engine (e.g., MySQL, PostgreSQL)"
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "security_group_ids" {
  description = "List of security groups to associate with the RDS instance"
  type        = list(string)
}

variable "skip_final_snapshot" {
  description = "Skip the final snapshot on deletion"
  type        = bool
  default     = true
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}
