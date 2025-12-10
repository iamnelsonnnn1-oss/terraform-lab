# modules/database/outputs.tf

output "db_instance_endpoint" {
  description = "The endpoint address of the RDS database instance."
  value       = aws_db_instance.main.address
}

output "db_security_group_id" {
  description = "The Security Group ID of the RDS database instance."
  value       = aws_security_group.db.id
}