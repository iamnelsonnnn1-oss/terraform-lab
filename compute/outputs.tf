# modules/compute/outputs.tf

output "app_security_group_id" {
  description = "The Security Group ID created for the application instances."
  value       = aws_security_group.app.id
}