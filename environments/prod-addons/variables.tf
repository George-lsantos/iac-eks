variable "region" {
  type = string
}

# Dados do backend remoto da camada environments/prod (o state que
# criou o cluster). Preencha com os mesmos valores usados no
# -backend-config de environments/prod.
variable "cluster_state_bucket" {
  type = string
}

variable "cluster_state_key" {
  type = string
}

variable "cluster_state_region" {
  type = string
}
