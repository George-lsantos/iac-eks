# Lê os outputs da camada environments/prod (cluster, node role,
# pod_subnets_by_az, etc.) sem precisar duplicar tfvars.
data "terraform_remote_state" "cluster" {
  backend = "s3"

  config = {
    bucket = var.cluster_state_bucket
    key    = var.cluster_state_key
    region = var.cluster_state_region
  }
}

# Nesta camada o cluster JÁ existe (foi criado pela camada prod),
# então essas data sources são lidas normalmente, sem risco de ciclo:
# aqui não há nenhum recurso aws_eks_cluster/aws_eks_node_group no
# mesmo grafo do provider kubernetes.
data "aws_eks_cluster" "this" {
  name = data.terraform_remote_state.cluster.outputs.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = data.terraform_remote_state.cluster.outputs.cluster_name
}



data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}