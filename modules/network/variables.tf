# modules/network/variables.tf

variable "project_name" {
  description = "The name of the overall project (e.g., day5-app)."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones to use for subnets."
  type        = list(string)
}