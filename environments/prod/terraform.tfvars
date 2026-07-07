project_name = "VPC-eks"
region       = "us-east-1"
vpc_cidr     = "10.1.0.0/16"

# Range secundário de CGNAT para os Pods do EKS (Mantido, pois é um bloco secundário associado à VPC)
vpc_additional_cidrs = ["100.64.0.0/16"]

public_subnets = [
  { name = "cerebro-pub-1a", cidr = "10.1.1.0/24", availability_zone = "us-east-1a" },
  { name = "cerebro-pub-1b", cidr = "10.1.2.0/24", availability_zone = "us-east-1b" }
]

private_subnets = [
  { name = "cerebro-pvt-1a", cidr = "10.1.10.0/24", availability_zone = "us-east-1a" },
  { name = "cerebro-pvt-1b", cidr = "10.1.11.0/24", availability_zone = "us-east-1b" }
]

database_subnets = [
  { name = "cerebro-db-1a", cidr = "10.1.20.0/24", availability_zone = "us-east-1a" },
  { name = "cerebro-db-1b", cidr = "10.1.21.0/24", availability_zone = "us-east-1b" }
]