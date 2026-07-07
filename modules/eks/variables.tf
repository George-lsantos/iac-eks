variable "project_name" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}


variable "node_role_arn" {
  type = string
}


variable "node_instance_types" {
  type = list(string)

  default = ["t3.micro"]
}

variable "node_desired_size" {
  type = number

  default = 2
}

variable "node_min_size" {
  type = number

  default = 2
}

variable "node_max_size" {
  type = number

  default = 4
}