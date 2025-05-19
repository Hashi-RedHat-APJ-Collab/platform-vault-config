resource "vault_identity_group" "admins" {
  name = "github_admins"
  type = "internal"
  policies = [
    "admin",
    "generate_certificate",
    "sign_ssh_certificate"
  ]
  member_entity_ids = [ 
    for v in vault_identity_entity.admins: v.id
  ]
}