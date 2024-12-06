resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  security_group_ids     = var.security_group_ids

  tags = {
    Name = "${var.project_name}-ec2-instance"
  }
}
