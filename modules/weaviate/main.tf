

resource "helm_release" "weaviate" {
  name             = "weaviate"
  namespace        = "weaviate"
  create_namespace = true
  repository       = "https://weaviate.github.io/weaviate-helm"
  chart            = "weaviate"
  version          = "17.5.1"  # latest available chart version
  timeout          = 600

  # Service types
  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "grpcService.type"
    value = "ClusterIP"
  }

  # Authentication
  #set {
  #  name  = "authentication.apikey.enabled"
  #  value = "true"
  #}

  #set {
  #  name  = "authentication.apikey.allowed_keys[0]"
  #  value = "\"z3EkNNu8HnEotF2JK2xNlG38xXOtRR6Ns3jEQsM5J3c=\""
  #}

  #set {
  #  name  = "authentication.apikey.users[0].username"
  #  value = "admin"
  #}

  #set {
  #  name  = "authentication.apikey.users[0].key"
  #  value = "\"z3EkNNu8HnEotF2JK2xNlG38xXOtRR6Ns3jEQsM5J3c=\""
  #}

  set {
    name  = "authentication.anonymous_access.enabled"
    value = "true"
  }

  # Log level
  set {
    name  = "logLevel"
    value = "info"
  }
}
