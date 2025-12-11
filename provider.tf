# providers.tf

terraform {
  backend "s3" {
    # CORRECTED BUCKET NAME verified from AWS Console
    bucket         = "nelson-terraform-lab-state-2025" 
    key            = "terraform-lab/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1" # Use your desired AWS region
}