project_name    = "iac-eks"

vpc_name        = "network-prod"
eks_cluster_name = "eks-prod"

region = "us-east-1"

vpc_cidr = "10.1.0.0/16"

vpc_additional_cidrs = [
  "10.2.0.0/16"
]

public_subnets = [
  {
    name              = "public-1a"
    cidr              = "10.1.1.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "public-1b"
    cidr              = "10.1.2.0/24"
    availability_zone = "us-east-1b"
  }
]

private_subnets = [
  {
    name              = "private-1a"
    cidr              = "10.1.10.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "private-1b"
    cidr              = "10.1.20.0/24"
    availability_zone = "us-east-1b"
  }
]

database_subnets = [

  {
    name              = "vpc-database_subnets-1a"
    cidr              = "10.1.51.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "vpc-database_subnets-1b"
    cidr              = "10.1.52.0/24"
    availability_zone = "us-east-1b"
  }
]

k8s_version = "1.33"