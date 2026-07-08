resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-node-group"

  node_role_arn = var.node_role_arn

  subnet_ids = var.private_subnet_ids

  capacity_type = "ON_DEMAND"

  instance_types = var.node_instance_types

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "${var.project_name}-node-group"
  }

  # Garante que o addon vpc-cni (custom networking) e o access entry
  # do node role já existam antes dos nodes subirem.
  # O ENIConfig fica em environments/prod-addons (camada separada,
  # que usa o provider kubernetes) para não criar dependência cíclica
  # entre os providers aws e kubernetes na mesma aplicação.
  depends_on = [
    aws_eks_addon.vpc_cni,
    aws_eks_access_entry.nodes
  ]
}
