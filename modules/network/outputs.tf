output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}


output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "public_route_table_id" {
  value = aws_route_table.public_internet_access.id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.main[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  value = aws_subnet.database[*].id
}

output "database_nacl_id" {
  value = aws_network_acl.database.id
}