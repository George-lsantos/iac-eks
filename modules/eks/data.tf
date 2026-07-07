data "aws_eks_cluster" "default" {
  name = aws_eks_cluster.main.name
}

data "aws_eks_cluster_auth" "default" {
  name = aws_eks_cluster.main.name
}

data "aws_caller_identity" "current" {}