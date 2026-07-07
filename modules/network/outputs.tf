output "vpc_id" {
  description = "O ID da VPC criada"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "O bloco CIDR principal da VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "Lista com os IDs de todas as subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Lista com os IDs de todas as subnets privadas (onde rodam os nodes/pods)"
  value       = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  description = "Lista com os IDs de todas as subnets de banco de dados"
  value       = aws_subnet.database[*].id
}

output "database_subnet_group_name" {
  description = "O nome do Subnet Group de banco de dados gerado para o RDS"
  value       = try(aws_db_subnet_group.database[0].name, "")
}