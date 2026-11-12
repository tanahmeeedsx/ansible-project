output "managed_node_public_ips" {
  description = "Public IP addresses of the Terraform-created managed nodes"
  value       = aws_instance.managed_nodes[*].public_ip
}

output "managed_node_private_ips" {
  description = "Private IP addresses of the Terraform-created managed nodes"
  value       = aws_instance.managed_nodes[*].private_ip
}

output "managed_node_instance_ids" {
  description = "EC2 instance IDs of the Terraform-created managed nodes"
  value       = aws_instance.managed_nodes[*].id
}

output "managed_node_security_group_id" {
  description = "Security group ID attached to the managed nodes"
  value       = aws_security_group.managed_nodes.id
}
