resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle"
  namespace = var.vault_namespace
}

# Set up the approle role for Ansible Automation Platform
# resource "vault_approle_auth_backend_role" "ansible" {
#   backend         = vault_auth_backend.approle.path
#   role_name       = "aap"
#   token_policies  = ["sign_ssh", "update_approle", "read_kv"]
# }

# resource "vault_approle_auth_backend_role_secret_id" "id" {
#   backend   = vault_auth_backend.approle.path
#   role_name = vault_approle_auth_backend_role.ansible.role_name
# }