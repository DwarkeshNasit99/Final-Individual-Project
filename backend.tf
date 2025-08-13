# Backend configuration for Terraform state management
# This project uses local state storage as per requirements

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Local backend configuration (state stored locally on laptop)
# In production, consider using S3 backend with DynamoDB for state locking
# backend "s3" {
#   bucket = "your-terraform-state-bucket"
#   key    = "prog8870-final/terraform.tfstate"
#   region = "us-east-1"
# }
