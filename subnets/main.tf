resource "aws_subnet" "public" {
  for_each = var.cidr_blocks.public_subnets
  vpc_id   = var.vpc_id
  cidr_block = each.value
  availability_zone = element(var.availability_zones, index(var.cidr_blocks.public_subnets, each.value))
  tags = {
    Name = "${var.project_name}-public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each = var.cidr_blocks.private_subnets
  vpc_id   = var.vpc_id
  cidr_block = each.value
  availability_zone = element(var.availability_zones, index(var.cidr_blocks.private_subnets, each.value))
  tags = {
    Name = "${var.project_name}-private-subnet-${each.key}"
  }
}
