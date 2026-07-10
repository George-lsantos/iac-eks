
variable "project_name" {
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

variable "pod_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  default = []
}

variable "k8s_version" {
  type = string
}

variable "admin_principal_arns" {
  type    = list(string)
  default = []
}


variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
  default     = "iac-eks"
}