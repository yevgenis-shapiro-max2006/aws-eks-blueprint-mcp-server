
variable "tfe_token" {
  description = "Terraform Enterprise API token"
  type        = string
  sensitive   = true
}

resource "kubernetes_secret" "terraform_mcp_tfe" {
  metadata {
    name      = "terraform-mcp-tfe"
    namespace = "terraform-mcp"
  }

  type = "Opaque"

  data = {
    TFE_TOKEN = var.tfe_token
  }
}

variable "tfe_address" {
  description = "Terraform Enterprise or HCP Terraform URL"
  type        = string
  default = "tfe.crypterio.co" 
}

variable "mcp_allowed_origins" {
  description = "Allowed MCP client origins"
  type        = string
  default = "ide.crypterio.co" 
}
