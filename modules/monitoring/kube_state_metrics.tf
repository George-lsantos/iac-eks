resource "helm_release" "kube_state_metrics" {
  name       = "kube-state-metrics"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-state-metrics"

  namespace = "kube-system"
  version   = "6.1.2"

  values = [
    yamlencode({
      metricLabelsAllowlist = [
        "nodes=[*]"
      ]

      metricAnnotationsAllowList = [
        "nodes=[*]"
      ]
    })
  ]
}