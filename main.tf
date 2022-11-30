locals {
  namespace_name = kubernetes_namespace.external_dns.metadata[0].name
}

resource "kubernetes_namespace" "external_dns" {
  metadata {
    labels      = var.labels
    annotations = var.annotations
    name        = var.name
  }
}

resource "helm_release" "external_dns" {
  name       = var.name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"
  namespace  = local.namespace_name

  cleanup_on_fail = true
  version         = "6.5.1"

  set {
    type  = "string"
    name  = "provider"
    value = "cloudflare"
  }

  set {
    type  = "string"
    name  = "cloudflare.email"
    value = var.cloudflare_email
  }

  set {
    type  = "string"
    name  = "cloudflare.secretName"
    value = kubernetes_secret.cloudflare.metadata[0].name
  }

  set {
    type  = "string"
    name  = "cloudflare.proxied"
    value = false
  }
}
