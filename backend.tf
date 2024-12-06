terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-bucket"
    key            = "vpc-ec2-rds-setup/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
