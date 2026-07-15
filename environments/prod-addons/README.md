# Prod-addons

Ambiente que provisiona recursos relacionados a addons e configurações que consomem o cluster EKS (ENIConfig, addons gerenciados, etc.).

Como aplicar

```bash
cd environments/prod-addons
terraform init
terraform plan
terraform apply
```

Notas

- Requer que o cluster EKS e recursos de rede (módulo `network` e `eks`) já existam.
- Configure o backend S3 apropriado em `backend.tf` antes de executar `terraform init`.
