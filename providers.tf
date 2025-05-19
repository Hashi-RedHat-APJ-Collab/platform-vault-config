
terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "~> 4"
    }
  }
}


provider "vault" {
  namespace = "admin/tfo-apj-demos"
}