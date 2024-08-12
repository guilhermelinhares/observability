resource "helm_release" "jaeger" {
  namespace  = var.monitoring_namespace
  name       = "jaegertracing"
  repository = "https://jaegertracing.github.io/helm-charts"
  chart      = "jaeger"

  values     = [file("${path.module}/manifests/values.yaml")]
  depends_on = []
}