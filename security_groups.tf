#security groups & Ports (ingress & egress)
resource "aws_security_group" "secgroup-pub" {
  name = "secgroup-pub"
  description = "Public Security Group"
  vpc_id      = aws_vpc.vpc_west_1.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "secgroup-pub"
  }
}

resource "aws_security_group" "secgroup-pr" {
  name = "secgroup-pr"
  description = "Private Security Group"
  vpc_id      = aws_vpc.vpc_west_1.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.sub_cidr_block[0]]
  }

  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = [var.sub_cidr_block[0]]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "secgroup-pr"
  }
}
