output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.subnets.public_subnet_ids
}

output "private_subnets" {
  value = module.subnets.private_subnet_ids
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "rds_endpoint" {
  value = module.rds.endpoint
}
