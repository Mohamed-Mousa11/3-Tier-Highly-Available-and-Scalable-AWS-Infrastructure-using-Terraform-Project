output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}
