#
# Victoria Metrics Resources
#

# Validar si el namespace ya existe
data "kubernetes_namespace" "victoria_system" {
  metadata {
    name = var.namespace_name
  }
}

# Crear el namespace solo si no existe
resource "kubernetes_namespace" "victoria_system" {
  metadata {
    name = var.namespace_name
  }
  count = length(data.kubernetes_namespace.victoria_system.id) == 0 ? 1 : 0
}

# Instalar Helm chart
resource "helm_release" "victoria_auth" {
  name       = var.helm_release_name
  namespace  = var.namespace_name
  repository = "https://victoriametrics.github.io/helm-charts/"
  chart      = "victoria-metrics-auth"
  version    = var.helm_chart_version
  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      ingress_enabled  = var.ingress_enabled,
      domain_name      = var.domain_name,
      dash_domain_name = var.dash_domain_name,
      issuer_name      = var.issuer_name,
      issuer_kind      = var.issuer_kind,
      pwd_metric_log   = var.pwd_metric_log
    })
  ]

  depends_on = [kubernetes_namespace.victoria_system]
}

locals {
  context = var.context
}
