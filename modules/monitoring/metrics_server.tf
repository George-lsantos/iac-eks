resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"

  namespace        = "kube-system"
  create_namespace = false

  version = "7.2.16"

  wait = true

  set {
    name  = "apiService.create"
    value = "true"
  }
}