terraform {
  required_version = ">= 1.9"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      # 6.0.0 e 6.1.x têm um bug conhecido no schema de "resource
      # identity" ("failed to decode identity: unsupported attribute"),
      # ver hashicorp/terraform-provider-aws#43178. Corrigido na 6.2.0.
      version = ">= 5.100, != 6.0.0, != 6.1.0, != 6.1.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
