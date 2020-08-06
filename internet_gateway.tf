# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_west_1.id

  tags = {
    Name = "igw_west_1"
  }
}