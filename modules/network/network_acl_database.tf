resource "aws_network_acl" "database" {
  vpc_id = aws_vpc.main.id

  egress {
    rule_no    = 200
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = format("%s-databases", var.project_name)
  }
}

resource "aws_network_acl_rule" "deny" {
  network_acl_id = aws_network_acl.database.id

  rule_number = 300
  rule_action = "deny"

  protocol   = "-1"
  cidr_block = "0.0.0.0/0"

  from_port = 0
  to_port   = 0
}


resource "aws_network_acl_association" "database" {
  count = length(var.database_subnets)

  subnet_id      = aws_subnet.database[count.index].id
  network_acl_id = aws_network_acl.database.id
}


resource "aws_network_acl_rule" "allow_mysql" {
  count = length(var.private_subnets)

  network_acl_id = aws_network_acl.database.id

  rule_number = 10 + count.index

  egress      = false
  rule_action = "allow"

  protocol = "tcp"

  cidr_block = aws_subnet.private[count.index].cidr_block

  from_port = 3306
  to_port   = 3306
}

resource "aws_network_acl_rule" "allow_redis" {
  count = length(var.private_subnets)

  network_acl_id = aws_network_acl.database.id

  rule_number = 20 + count.index

  egress      = false
  rule_action = "allow"

  protocol = "tcp"

  cidr_block = aws_subnet.private[count.index].cidr_block

  from_port = 6379
  to_port   = 6379
}

resource "aws_network_acl_rule" "allow_ephemeral" {
  count = length(var.private_subnets)

  network_acl_id = aws_network_acl.database.id

  rule_number = 100 + count.index

  egress      = false
  rule_action = "allow"

  protocol = "tcp"

  cidr_block = aws_subnet.private[count.index].cidr_block

  from_port = 1024
  to_port   = 65535
}