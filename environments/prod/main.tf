module "network" {
  source = "../../modules/network"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  vpc_additional_cidrs = var.vpc_additional_cidrs
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  database_subnets     = var.database_subnets
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
}


module "eks" {
  source = "../../modules/eks"

  project_name = var.project_name
  k8s_version  = var.k8s_version

  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  private_subnet_ids = module.network.private_subnet_ids
}