module "prometheus" {
  source                   = "./modules/prometheus"

  monitoring_namespace     = var.monitoring_namespace
  depends_on = [kubernetes_namespace.monitoring_namespace]
}

module "grafana-loki" {
  source                   = "./modules/grafana-loki"

  monitoring_namespace     = var.monitoring_namespace
  depends_on = [kubernetes_namespace.monitoring_namespace]
}

module "jaeger" {
  source                   = "./modules/jaeger"

  monitoring_namespace     = var.monitoring_namespace
  depends_on = [kubernetes_namespace.monitoring_namespace]
}

module "opentelemetry" {
  source                   = "./modules/opentelemetry"

  monitoring_namespace     = var.monitoring_namespace
  depends_on = [kubernetes_namespace.monitoring_namespace]
}