
resource "helm_release" "weaviate" {
  name             = "weaviate"
  namespace        = "weaviate"
  create_namespace = true

  repository = "https://weaviate.github.io/weaviate-helm"
  chart      = "weaviate"
  version    = "17.5.1"

  timeout          = 1200
  atomic           = true
  cleanup_on_fail  = true
  wait             = true

  set {
    name  = "replicas"
    value = "3"
  }

  set {
    name  = "podManagementPolicy"
    value = "Parallel"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "grpcService.type"
    value = "ClusterIP"
  }

  set {
    name  = "storage.size"
    value = "10Gi"
  }

  set {
    name  = "authentication.anonymous_access.enabled"
    value = "true"
  }

  set {
    name  = "logLevel"
    value = "info"
  }

  set {
    name  = "serviceMonitor.enabled"
    value = "true"
  }
}

