resource "helm_release" "opentelemetry" {
  namespace  = var.monitoring_namespace
  name       = "opentelemetry"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart      = "opentelemetry-operator"

  values     = [file("${path.module}/manifests/values.yaml")]
  depends_on = []
}


resource "kubectl_manifest" "otel_collector" {
  yaml_body  = file("${path.module}/manifests/otel-collector.yaml")
  depends_on = [helm_release.opentelemetry]
}