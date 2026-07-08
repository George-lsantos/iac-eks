output "vpc_id" {
  value = module.network.vpc_id
}

output "vpc_cidr" {
  value = module.network.vpc_cidr
}

output "internet_gateway_id" {
  value = module.network.internet_gateway_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "public_route_table_id" {
  value = module.network.public_route_table_id
}

output "nat_gateway_ids" {
  value = module.network.nat_gateway_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}
output "database_subnet_ids" {
  value = module.network.database_subnet_ids
}


output "database_nacl_id" {
  value = module.network.database_nacl_id
}

output "public_nacl_id" {
  value = module.network.public_nacl_id
}

output "private_nacl_id" {
  value = module.network.private_nacl_id
}

output "pod_subnet_ids" {
  value = module.network.pod_subnet_ids
}

# Consumido pela camada environments/prod-addons (ENIConfig por AZ)
output "pod_subnets_by_az" {
  value = module.network.pod_subnets_by_az
}

######IAM
output "cluster_role_arn" {
  value = module.iam.cluster_role_arn
}

output "node_role_arn" {
  value = module.iam.node_role_arn
}


output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

# Consumido pela camada environments/prod-addons (provider kubernetes
# e security group do ENIConfig)
output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "node_group_name" {
  value = module.eks.node_group_name
}
