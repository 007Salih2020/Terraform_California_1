# Subnet -   
 
resource "aws_subnet" "sub-public" {
  vpc_id            = aws_vpc.vpc_west_1.id
  cidr_block        = var.sub_cidr_block[0]
  availability_zone = var.az[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-public"
  }
}

resource "aws_subnet" "sub-private" {
  vpc_id     = aws_vpc.vpc_west_1.id
  cidr_block = var.sub_cidr_block[1]
  availability_zone = var.az[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "sub-private"
  }
}

