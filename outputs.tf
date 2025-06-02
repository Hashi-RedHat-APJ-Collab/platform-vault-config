
# output approle_mount_accessor
output "approle_mount_accessor" {
  description = "Mount accessor for the AppRole authentication backend"
  value       = vault_auth_backend.approle.accessor
}

# kvv2_mount_path
output "kvv2_mount_path" {
  description = "Path for the KV v2 secrets engine"
  value       = vault_mount.kvv2.path
}