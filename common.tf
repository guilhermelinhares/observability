resource "kubernetes_namespace" "monitoring_namespace" {
  metadata {
    name = var.monitoring_namespace
  }

  depends_on = [
  ]
}