
terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "4.8.0"
    }

    tfe = {
      source = "hashicorp/tfe"
      version = "0.65.2"
    }
  }
}


provider "vault" {
}

provider "tfe" {
  organization = var.tfc_organization
}