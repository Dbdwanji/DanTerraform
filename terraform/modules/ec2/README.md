# s10
...
ttt
my work

#  Data source to retrieve the VPC with a specific Name tag
# data "aws_vpc" "vpc" {
#   filter {
#     name   = "tag:Name"
#     values = ["default vpc"]  # Replace with the actual Name tag of your VPC
#   }
# }

data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = ["ec2_security_group"]  # Replace with the actual Name tag of your VPC
  }

  filter {
    name   = "tag:environment"
    values = ["dev"]  # Replace with the actual Name tag of your VPC
  }
}

# Output the filtered VPC ID
output "sg" {
  value = data.aws_security_group.sg.id
}

# Output the filtered VPC ID
output "name" {
  value = data.aws_security_group.sg.name
}

#  Output the filtered VPC ID
# output "filtered_vpc_id" {
#   value = data.aws_vpc.filtered_vpc.id
# }

tags = {
     Name          = "${var.tags["environment"]}-${var.tags["project"]}-jenkins-master"
     owner         = var.tags["owner"]
    environment    = var.tags["environment"]
    project        = var.tags["project"]
    create_by      = var.tags["create_by"]
    cloud_provider = var.tags["cloud_provider"]
    }

    tags = {
     name          = "${var.tags["environment"]}-${var.tags["project"]}-jenkins-master"
     owner         = var.tags["owner"]
    environment    = var.tags["environment"]
    project        = var.tags["project"]
    create_by      = var.tags["create_by"]
    cloud_provider = var.tags["cloud_provider"]
    }

    format("%s-jenkins-master", var.tags["project"])
    format("%s-%s-jenkins-master", var.tags["environment"], var.tags["project"])
  
  
  # Optional tags
  tags = merge(var.tags, {
    Name = "jenkins-master"
  })
}
      