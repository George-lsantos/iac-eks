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

  labels = {
    "capacity/os"   = "amazonlinux2023"
    "capacity/arch" = "amd64"
    "capacity/type" = "on-demand"
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "${var.project_name}-node-group"
  }

  depends_on = [
    aws_eks_access_entry.nodes
  ]
}