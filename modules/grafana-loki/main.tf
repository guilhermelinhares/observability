resource "helm_release" "grafana_loki" {
  namespace  = var.monitoring_namespace
  name       = "grafana-loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki"

  values = [file("${path.module}/manifests/values.yaml")
  ]
  depends_on = [
  ]
}