variable "project_name" {
  type        = string
  description = "Nome do projeto utilizado para compor as tags"
}

variable "region" {
  type        = string
  description = "Região da AWS para o provisionamento"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR principal da VPC"
}

variable "vpc_additional_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs adicionais da VPC (ex: CGNAT para Pods)"
  default     = []
}

variable "public_subnets" {
  description = "Lista de objetos das subnets públicas"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "Lista de objetos das subnets privadas"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "database_subnets" {
  description = "Lista de objetos das subnets de banco de dados"
  default     = []
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}