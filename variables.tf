# variables.tf (Root Variables File)

# This file is intentionally minimal or empty because 
# the main configuration relies on local values and 
# variables passed directly to the modules. 
#
# If you were to define the AWS region here, it would look like this:
/*
variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "us-east-1"
}
*/