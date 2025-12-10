# modules/compute/variables.tf

variable "project_name" {
  description = "The name of the overall project."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the compute resources will be deployed."
  type        = string
}

variable "public_subnet_ids" {
  description = "A list of public subnet IDs (e.g., for an ALB)."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs for the compute instances (EC2/ASG)."
  type        = list(string)
}

variable "db_sg_id" {
  description = "The Security Group ID of the database to allow traffic from the compute resources."
  type        = string
}