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
