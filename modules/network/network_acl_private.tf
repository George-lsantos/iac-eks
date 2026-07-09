resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-private", var.project_name)
  }
}

# Libera todo o tráfego interno da VPC (CIDR primário + CIDRs
# secundários, como o range de pods). Isso permite comunicação
# irrestrita entre nodes, pods e o control plane, mantendo o
# bloqueio de qualquer origem externa que não venha pela NACL
# pública/NAT.
resource "aws_network_acl_rule" "private_ingress_primary_cidr" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = var.vpc_cidr
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_ingress_additional_cidrs" {
  count = length(var.vpc_additional_cidrs)

  network_acl_id = aws_network_acl.private.id
  rule_number    = 110 + count.index
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = var.vpc_additional_cidrs[count.index]
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_ingress_ephemeral" {
  network_acl_id = aws_network_acl.private.id

  rule_number = 120
  egress      = false

  protocol    = "tcp"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 1024
  to_port   = 65535
}

resource "aws_network_acl_rule" "private_egress_all" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  network_acl_id = aws_network_acl.private.id
}

resource "aws_network_acl_association" "pods" {
  count = length(var.pod_subnets)

  subnet_id      = aws_subnet.pods[count.index].id
  network_acl_id = aws_network_acl.private.id
}
