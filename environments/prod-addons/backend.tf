terraform {
  backend "s3" {
    # Mesmo bucket usado em environments/prod, mas com uma key
    # diferente (ex.: "prod-addons/terraform.tfstate"), passada via
    # -backend-config, igual você já faz para o environments/prod.
  }
}
