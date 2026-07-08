# Substitui o ConfigMap aws-auth (modo legado, arquivo aws_auth.tf
# antigo - APAGUE esse arquivo) pelo mecanismo nativo de EKS Access
# Entries, agora que authentication_mode = "API" em cluster.tf.

resource "aws_eks_access_entry" "nodes" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = var.node_role_arn
  type          = "EC2_LINUX"
}

# Acesso administrativo opcional para usuários/roles adicionais.
# Passe os ARNs via var.admin_principal_arns (ex.: sua role de SSO,
# um usuário IAM específico para você mesmo, etc.)
resource "aws_eks_access_entry" "admins" {
  for_each = toset(var.admin_principal_arns)

  cluster_name  = aws_eks_cluster.main.name
  principal_arn = each.value
}

resource "aws_eks_access_policy_association" "admins" {
  for_each = toset(var.admin_principal_arns)

  cluster_name  = aws_eks_cluster.main.name
  principal_arn = each.value
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
