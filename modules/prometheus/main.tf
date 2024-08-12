resource "helm_release" "prometheus" {
  namespace  = var.monitoring_namespace
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "61.8.0" 
  
  # values = [file("${path.module}/manifests/values.yaml")]
  depends_on = []
}

resource "helm_release" "prometheus_adapter" {
  namespace  = var.monitoring_namespace
  name       = "adapter"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-adapter"

  values = [templatefile("${path.module}/manifests/adapter.yaml", {
    namespace = var.monitoring_namespace
  })]

  depends_on = [
    helm_release.prometheus
  ]
}