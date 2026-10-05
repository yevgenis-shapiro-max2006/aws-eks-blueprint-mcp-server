
terraform {
  backend "s3" {
    bucket = "apps-terraform-clusters"
    key    = "eks-mcp-server/terraform.tfstate"
    region = "eu-central-1"
  }
}
