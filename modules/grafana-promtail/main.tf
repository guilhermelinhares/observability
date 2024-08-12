
resource "helm_release" "promtail" {
  namespace  = var.monitoring_namespace
  name       = "grafana-promtail"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "promtail"

  values = [file("${path.module}/manifests/values.yaml")]
  depends_on = [

  ]
}