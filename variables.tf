variable "tfc_organization" {
  description = "The Terraform Cloud organization."
  type        = string
}

variable "tfc_workspace" {
  description = "The Terraform Cloud workspace."
  type        = string
}

variable "vault_namespace" {
  description = "The Vault namespace to use."
  type        = string
  default     = "admin/hashi-redhat"
}