provider "aws" {
  region = aws_region
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

# locals {
#     aws_region = "us-east-1"

# instance_type = "t2.micro"

# key_name = "Dwanj"

# resource_type = "jenkins-master"

# root_volume = 30

# tags = {
    
#     "owner"          = "EK TECH SOFTWARE SOLUTIONS"
#     "environment"    = "dev"
#     "project"        = "del"
#     "create_by"      = "Terraform"
#     "cloud_provider" = "aws"
#   }
# }

# module "jenkins-sg" {
    
#   source = "../../../modules/ec2"
  
#   aws_region = local.aws_region

# instance_type = local.instance_type

# key_name = local.key_name

# resource_type = local.resource_type

# root_volume = local.root_volume

# tags = local.tags

# }

module "jenkins-sg" {
    
  source = "../../../../modules/sg"

   aws_region = "us-east-1"
   sg_name = "jenkins-master"
   ingress_ports = [
     22,
     80,
     443,
     8080
   ]

tags = {
  
    "owner"          = "EK TECH SOFTWARE SOLUTIONS"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
