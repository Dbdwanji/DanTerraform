variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "tags" {
  type = map(string)
  default = {
    
    "owner"          = "EK TECH SOFTWARE SOLUTIONS"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "resource_type" {
  type = string
  default = "jenkins-master"
}

# variable tags {
#   type = map(string)
#   default = {
#     "name"           = "jenkins-master"
#     "owner"          = "EK TECH SOFTWARE SOLUTIONS"
#     "environment"    = "dev"
#     "project"        = "del"
#     "create_by"      = "Terraform"
#     "cloud_provider" = "aws"
#   }
# }

variable "root_volume" {
  type   = number
  default = 30
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "Dwanj"
}






