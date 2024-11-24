variable "aws_region" {
  type = string

}

variable "tags" {
  type = map(string)
}

variable "resource_type" {
  type = string
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
  type = number
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}





