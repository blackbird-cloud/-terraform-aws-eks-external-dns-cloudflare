resource "kubernetes_secret" "cloudflare" {
  metadata {
    name      = "cloudflare"
    namespace = local.namespace_name
  }

  data = {
    cloudflare_api_token = base64decode(var.cloudflare_token)
  }
}
