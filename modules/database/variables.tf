# modules/database/variables.tf

variable "project_name" {
  description = "The name of the overall project."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the database will be deployed."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the database."
  type        = list(string)
}

variable "db_password" {
  description = "Password for the database instance."
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "The instance class for the RDS database."
  type        = string
}