resource "aws_subnet" "pods" {
  count             = length(var.pod_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.pod_subnets[count.index].cidr
  availability_zone = var.pod_subnets[count.index].availability_zone

  tags = {
    Name = var.pod_subnets[count.index].name
  }

  depends_on = [
    aws_vpc_ipv4_cidr_block_association.main
  ]
}

# Reaproveita a route table privada da mesma AZ (que já aponta pro NAT
# Gateway correspondente), garantindo que os pods tenham saída para a
# internet sem precisar de um NAT dedicado.
resource "aws_route_table_association" "pods" {
  count = length(var.pod_subnets)

  subnet_id = aws_subnet.pods[count.index].id

  route_table_id = aws_route_table.private[
    index(
      var.private_subnets[*].availability_zone,
      var.pod_subnets[count.index].availability_zone
    )
  ].id
}
