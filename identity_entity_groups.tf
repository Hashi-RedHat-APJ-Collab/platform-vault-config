resource "vault_identity_group" "admins" {
  name = "OwnersTeam"
  type = "internal"
  policies = [
    "admin",
    "auth_to_oidc",
    "generate_certificate",
    "sign_ssh_certificate"
  ]
  member_entity_ids = [ 
    for v in vault_identity_entity.admins: v.id
  ]
}