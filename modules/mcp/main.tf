
resource "kubernetes_namespace_v1" "terraform_mcp" {
  metadata {
    name = "terraform-mcp"
  }
}

resource "helm_release" "terraform_mcp_server" {
  name       = "terraform-mcp-server"
  namespace  = kubernetes_namespace_v1.terraform_mcp.metadata[0].name

  chart = "${path.module}/helm/terraform-mcp-server"

  timeout          = 1200
  wait             = true
  atomic           = true
  cleanup_on_fail  = true

  set {
    name  = "mcpServer.tfeAddress"
    value = var.tfe_address
  }

  set {
    name  = "mcpServer.allowedOrigins"
    value = var.mcp_allowed_origins
  }

  depends_on = [
    kubernetes_namespace_v1.terraform_mcp
  ]
}
