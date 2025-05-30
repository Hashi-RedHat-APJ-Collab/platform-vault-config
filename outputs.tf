
# output approle_mount_accessor
output "approle_mount_accessor" {
  description = "Mount accessor for the AppRole authentication backend"
  value       = vault_auth_backend.approle.accessor
}