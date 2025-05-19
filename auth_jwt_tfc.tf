#create vault mount for jwt_tfc
resource "vault_auth_backend" "jwt_tfc" {
  type = "jwt"
  path = "jwt_tfc"
}


resource "vault_jwt_auth_backend_role" "admins" {
  backend         = vault_auth_backend.jwt_tfc.path
  role_name       = "vault_admins"
  token_policies  = [
    #vault_policy.generate_tfc_token.name,
    "default"
  ]

  bound_audiences = [
    "vault.tfc.workspace.identity"
  ]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:Hashi-RedHat-APJ-Collab:*:workspace:*:run_phase:*"
    terraform_organization_id = "org-MpxsQ7Cnd14H4TQy"
  }
  user_claim      = "terraform_full_workspace"
  role_type       = "jwt"

  claim_mappings = {
    terraform_project_id = "terraform_project_id"
    terraform_workspace_id = "terraform_workspace_id"
  }
}

resource "vault_jwt_auth_backend_role" "tfc" {
  backend         = vault_auth_backend.jwt_tfc.path
  role_name       = "tfc"
  token_policies  = [
    "terraform_cloud",
    "vault_unseal",
    "generate_certificate",
    "create_child_token",
    "sign_ssh_certificate",
    ]

  bound_audiences = [
    "vault.tfc.workspace.identity"
  ]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:tfo-apj-demos:*"
    terraform_organization_id = "org-6nfrqkZhPPHJWG5h"
  }
  user_claim      = "terraform_full_workspace"
  role_type       = "jwt"

  claim_mappings = {
    terraform_project_id = "terraform_project_id"
    terraform_workspace_id = "terraform_workspace_id"
  }
}