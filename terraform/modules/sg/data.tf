# data "aws_vpc" "vpc" {
#   default = true
# }

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc"]
  }
}