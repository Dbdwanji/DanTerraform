#  Data source to retrieve the VPC with a specific Name tag
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc"] # Replace with the actual Name tag of your VPC
  }
}

data "aws_subnet" "subnet_01" {
  filter {
    name   = "tag:Name"
    values = ["default01"] # Replace with the actual Name tag of your VPC
  }
}

# Data source for the custom AMI with the tag "s8-jenkins-master"
data "aws_ami" "jenkins_master_ami" {
  filter {
    name   = "tag:Name"
    values = ["s8-jenkins-master"]
  }
}
