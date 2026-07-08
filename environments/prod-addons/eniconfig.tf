# Um ENIConfig por AZ, apontando para a subnet de pods correspondente
# (criada pela camada environments/prod). O CNI usa o label
# "topology.kubernetes.io/zone" do node (setado automaticamente pelo
# EKS) para escolher o ENIConfig certo.
resource "kubernetes_manifest" "eniconfig" {
  for_each = data.terraform_remote_state.cluster.outputs.pod_subnets_by_az

  manifest = {
    apiVersion = "crd.k8s.amazonaws.com/v1alpha1"
    kind       = "ENIConfig"
    metadata = {
      name = each.key
    }
    spec = {
      subnet = each.value
      securityGroups = [
        data.terraform_remote_state.cluster.outputs.cluster_security_group_id
      ]
    }
  }
}
