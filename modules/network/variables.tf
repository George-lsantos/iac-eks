variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}


variable "vpc_additional_cidrs" {
  type    = list(string)
  default = []
}

variable "public_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  default = []
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

