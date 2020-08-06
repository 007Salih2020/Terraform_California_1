# Route tables
resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.vpc_west_1.id  
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

    tags = {
    Name = "rt-pub"
  } 
}

resource "aws_route_table" "rt-pr" {
  vpc_id = aws_vpc.vpc_west_1.id  
  
    tags = {
    Name = "rt-pr"
  }
}