
variable "project_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}


variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_additional_cidrs" {
  type = list(string)
}

variable "public_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}


variable "private_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "database_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "k8s_version" {
  type = string
}