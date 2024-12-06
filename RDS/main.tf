resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  instance_class       = var.instance_class
  engine               = var.engine
  engine_version       = var.engine_version
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.subnet_group_name
  vpc_security_group_ids = var.security_group_ids
  skip_final_snapshot  = var.skip_final_snapshot

  tags = {
    Name = "${var.project_name}-rds"
  }
}
