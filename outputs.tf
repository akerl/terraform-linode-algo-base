output "ip_address" {
  value       = "${linode_instance.algo.ip_address}"
  description = "Public IP of the Linode"
}

output "linode_id" {
  value       = "${linode_instance.algo.id}"
  description = "The ID of the Linode"
}

output "disk_id" {
  value = "${linode_instance.algo.disk.0.id}"
}
