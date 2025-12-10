# Root main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}



# 1. Network Module: Creates the VPC and Subnets
module "app_network" {
  source = "./modules/network"

  project_name       = "day5-app"
  vpc_cidr           = "10.10.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# 2. Database Module: Creates the RDS Instance
module "app_database" {
  source = "./modules/database"

  project_name       = "day5-app"
  
  # VPC details passed from the Network module outputs
  vpc_id             = module.app_network.vpc_id
  private_subnet_ids = module.app_network.private_subnet_ids
  vpc_cidr           = "10.10.0.0/16" 
  
  db_password        = "P@sswOrd1234" 
  db_instance_class  = "db.t3.micro"
}