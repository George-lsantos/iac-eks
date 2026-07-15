## Módulo monitoring

Instala componentes de observabilidade via Helm (metrics-server, kube-state-metrics).

Uso

```hcl
module "monitoring" {
	source = "../../modules/monitoring"
}
```

Notas

- Requer provider `helm` configurado (via `providers.tf` no ambiente).

## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
