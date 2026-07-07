resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index].cidr
  availability_zone       = var.public_subnets[count.index].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnets[count.index].name
  }

  depends_on = [aws_vpc_ipv4_cidr_block_association.main]
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].availability_zone

  tags = {
    Name = var.private_subnets[count.index].name
  }

  depends_on = [aws_vpc_ipv4_cidr_block_association.main]
}

resource "aws_subnet" "database" {
  count             = length(var.database_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnets[count.index].cidr
  availability_zone = var.database_subnets[count.index].availability_zone

  tags = {
    Name = var.database_subnets[count.index].name
  }

  depends_on = [aws_vpc_ipv4_cidr_block_association.main]
}

resource "aws_db_subnet_group" "database" {
  count      = length(var.database_subnets) > 0 ? 1 : 0
  name       = format("%s-db-subnet-group", var.project_name)
  subnet_ids = aws_subnet.database[*].id

  tags = {
    Name = format("%s-db-subnet-group", var.project_name)
  }
}
