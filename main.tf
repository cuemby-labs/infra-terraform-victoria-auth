#
# Victoria Metrics Resources
#
resource "kubernetes_namespace" "victoria_auth" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "victoria_auth" {
  name       = var.helm_release_name
  namespace  = var.namespace_name
  repository = "https://victoriametrics.github.io/helm-charts/"
  chart      = "victoria-metrics-auth"
  version    = var.helm_chart_version
  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      ingress_enabled                 = var.ingress_enabled,
      domain_name                     = var.domain_name,
      dash_domain_name                = var.dash_domain_name
      issuer_name                     = var.issuer_name
      issuer_kind                     = var.issuer_kind
    })
  ]
}

locals {
  context = var.context
}