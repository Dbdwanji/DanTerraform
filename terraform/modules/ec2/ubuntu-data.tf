# provider "aws" {
#   region = "us-east-1" # Replace with your desired AWS region
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical's AWS Account ID
# }

# output "ubuntu_ami_id" {
#   value = data.aws_ami.ubuntu.id
# }