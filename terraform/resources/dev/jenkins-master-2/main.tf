provider "aws" {
  region = "us-east-1"
}

# Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "jenkins-master" {
    
  source = "../../../modules/jenkins-simple"

   aws_region = "us-east-1"

instance_type = "t2.micro"

key_name = "Dwanj"

resource_type = "jenkins-master"

root_volume = 30

tags = {
  
    "owner"          = "EK TECH SOFTWARE SOLUTIONS"
    "environment"    = "dev"
    "project"        = "beta"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
