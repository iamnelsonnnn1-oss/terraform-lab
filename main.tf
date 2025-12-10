# main.tf (Root Configuration File - FINAL & COMPLETE VERSION)

# ----------------------------------------------------------------
# 1. Terraform Configuration (Providers and Versioning)
# ----------------------------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # >>> REMOTE STATE BACKEND CONFIGURATION <<<
  # IMPORTANT: This block tells Terraform where to store the state file securely.
  # Using S3 provides state locking (via DynamoDB) and encryption for team collaboration. 
  backend "s3" {
    bucket         = "your-unique-terraform-state-bucket-day5" # MUST be globally unique
    key            = "terraform-day5/state.tfstate"           # The path/name of the state file in the bucket
    region         = "us-east-1"
    encrypt        = true                                     # Encrypts the state file at rest
    dynamodb_table = "terraform-locks"                        # Table used for state locking (to prevent concurrent changes)
  }
}

# ----------------------------------------------------------------
# 2. Local Values (Common Variables/Tags)
# ----------------------------------------------------------------
locals {
  project_name = "day5-app"
  vpc_cidr     = "10.10.0.0/16"
}

# ----------------------------------------------------------------
# 3. Module Calls
# ----------------------------------------------------------------

# Network Module: Creates VPC, Subnets, Internet Gateway, etc.
module "app_network" {
  source = "./modules/network"

  project_name       = local.project_name
  vpc_cidr           = local.vpc_cidr
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# Database Module: Creates RDS instance, DB Subnet Group, and Security Group
module "app_database" {
  source = "./modules/database"

  project_name       = local.project_name
  
  # VPC details are passed from the Network module's output
  vpc_id             = module.app_network.vpc_id
  private_subnet_ids = module.app_network.private_subnet_ids
  
  # Sensitive/Custom variables
  db_password        = "P@sswOrd1234"
  db_instance_class  = "db.t3.micro"
}

# Compute Module (Conceptual - Not wired up yet, as per our plan)
/*
module "app_compute" {
  source = "./modules/compute"

  project_name       = local.project_name
  vpc_id             = module.app_network.vpc_id
  public_subnet_ids  = module.app_network.public_subnet_ids
  private_subnet_ids = module.app_network.private_subnet_ids
  db_sg_id           = module.app_database.db_security_group_id 
}
*/