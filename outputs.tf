# outputs.tf (Root Outputs File)

# ----------------------------------------------------------------
# 1. Network Outputs
# ----------------------------------------------------------------
output "vpc_id" {
  description = "The ID of the VPC created for the application."
  value       = module.app_network.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs created by the network module."
  value       = module.app_network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs created by the network module."
  value       = module.app_network.private_subnet_ids
}


# ----------------------------------------------------------------
# 2. Database Outputs
# ----------------------------------------------------------------
output "rds_instance_endpoint" {
  description = "The hostname endpoint for the RDS PostgreSQL database instance."
  value       = module.app_database.db_instance_endpoint
}

output "db_security_group_id" {
  description = "The Security Group ID for the RDS database instance."
  value       = module.app_database.db_security_group_id
}

# ----------------------------------------------------------------
# 3. Compute Outputs (Conceptual - If we were deploying the compute module)
# ----------------------------------------------------------------
/*
output "app_security_group_id" {
  description = "The Security Group ID for the application instances."
  value       = module.app_compute.app_security_group_id
}
*/