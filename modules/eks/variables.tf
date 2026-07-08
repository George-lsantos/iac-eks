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

# --- Custom networking (pods em subnets/CIDR dedicados) ---

variable "pod_subnets_by_az" {
  description = "Mapa AZ => subnet_id das subnets de pods (CIDR secundário), vindo do módulo network."
  type        = map(string)
  default     = {}
}

# --- EKS Access Entries ---

variable "admin_principal_arns" {
  description = "ARNs de usuários/roles IAM que devem receber acesso de admin no cluster via Access Entries."
  type        = list(string)
  default     = []
}
