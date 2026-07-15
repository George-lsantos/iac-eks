# iac-eks

Repositório com módulos e ambientes Terraform para criar infraestrutura EKS (VPC, subnets, NAT, roles, cluster, addons).

Estrutura principal:

- `modules/` - módulos reutilizáveis (`network`, `eks`, `iam`, `monitoring`, ...)
- `environments/` - configurações por ambiente (`prod`, `prod-addons`, ...)

Quickstart

```bash
git clone <repo-url>
cd iac-eks
cd environments/prod
terraform init
terraform plan
terraform apply
```

Estado / Backend

Configure `environments/*/backend.tf` com um bucket S3 e `dynamodb_table` para bloqueio antes de executar `terraform init`.

Documentação

Regenerar documentação dos módulos:

```bash
terraform-docs markdown table modules/<module> > modules/<module>/README.md
```

Contribuição

- Rode `terraform fmt` e `terraform validate` antes de abrir PR.
- Atualize os READMEs dos módulos quando alterar inputs/outputs.
