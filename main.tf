module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.vpc_cidr_block
  project_name = var.project_name
}

module "subnets" {
  source             = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id
  cidr_blocks        = var.subnet_cidr_blocks
  availability_zones = var.availability_zones
  project_name       = var.project_name
}

module "routing-tables" {
  source              = "./modules/routing-tables"
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.subnets.public_subnet_ids
  private_subnet_ids  = module.subnets.private_subnet_ids
  project_name        = var.project_name
}

module "routing-association" {
  source              = "./modules/routing-association"
  public_subnet_ids   = module.subnets.public_subnet_ids
  private_subnet_ids  = module.subnets.private_subnet_ids
  project_name        = var.project_name
}

module "security-groups" {
  source       = "./modules/security-groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "ec2" {
  source             = "./modules/ec2"
  public_subnet_ids  = module.subnets.public_subnet_ids
  security_group_id  = module.security-groups.ec2_sg_id
  instance_type      = var.ec2_instance_type
  ami_id             = var.ec2_ami_id
  key_name           = var.ec2_key_name
  project_name       = var.project_name
}

module "rds" {
  source             = "./modules/rds"
  private_subnet_ids = module.subnets.private_subnet_ids
  security_group_id  = module.security-groups.rds_sg_id
  db_instance_class  = var.rds_instance_class
  db_name            = var.rds_db_name
  db_username        = var.rds_username
  db_password        = var.rds_password
  project_name       = var.project_name
}
