# VPC 
resource "aws_vpc" "vpc_west_1" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = "vpc_west_1"
  }
}
