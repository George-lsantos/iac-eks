# --- INSTANCIAÇÃO DO MÓDULO DE REDE (VPC) ---
module "network" {
  source = "../../modules/network"

  project_name         = var.project_name
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  vpc_additional_cidrs = var.vpc_additional_cidrs
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  database_subnets     = var.database_subnets
}

# --- MÓDULOS COMENTADOS (Para ativação futura após a rede estar criada) ---

# module "iam" {
#   source       = "../../modules/iam"
#   project_name = var.project_name
# }

# module "security" {
#   source       = "../../modules/security"
#   project_name = var.project_name
#   vpc_id       = module.network.vpc_id
# }

# module "eks" {
#   source       = "../../modules/eks"
#   project_name = var.project_name
#   vpc_id       = module.network.vpc_id
#   subnet_ids   = module.network.private_subnet_ids
#   depends_on   = [module.network]
# }