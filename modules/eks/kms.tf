resource "aws_kms_key" "main" {
  description             = "${var.project_name}-eks-secrets"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = "${var.project_name}-kms"
  }
}