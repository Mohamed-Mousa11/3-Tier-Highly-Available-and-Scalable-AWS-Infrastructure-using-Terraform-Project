# General Variables
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for tagging"
  default     = "aws-vpc-ec2-rds-architecture"
}

# VPC Variables
variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "172.16.0.0/16"
}

# Subnets Variables
variable "subnet_cidr_blocks" {
  description = "CIDR blocks for public and private subnets"
  type = object({
    public_subnets  = list(string)
    private_subnets = list(string)
  })
  default = {
    public_subnets  = ["172.16.0.0/24", "172.16.1.0/24"]
    private_subnets = ["172.16.2.0/24", "172.16.3.0/24"]
  }
}

variable "availability_zones" {
  description = "Availability Zones for subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# EC2 Variables
variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-12345678"  # Replace with valid AMI ID
}

variable "ec2_key_name" {
  description = "Key pair name for EC2"
  default     = "my-key-pair"  # Replace with your key pair
}

# RDS Variables
variable "rds_instance_class" {
  description = "RDS instance class"
  default     = "db.t2.micro"
}

variable "rds_db_name" {
  description = "RDS database name"
  default     = "mydatabase"
}

variable "rds_username" {
  description = "RDS master username"
  default     = "admin"
}

variable "rds_password" {
  description = "RDS master password"
  default     = "strongpassword123"  # Update with a strong password
}
