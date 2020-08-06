# Route table associations
resource "aws_route_table_association" "route_assoc_pub" {
  subnet_id      = aws_subnet.sub-public.id
  route_table_id = aws_route_table.rt-pub.id
}

resource "aws_route_table_association" "route_assoc_pr" {
  subnet_id      = aws_subnet.sub-private.id
  route_table_id = aws_route_table.rt-pr.id
}