#   Output the filtered VPC ID
output "vpc_id" {
  value = data.aws_vpc.vpc.id
}

#   Output the filtered VPC ID
output "subnet_01" {
  value = data.aws_subnet.subnet_01.id
}

#   Output the filtered VPC ID
output "aws_ami" {
  value = data.aws_ami.jenkins_master_ami.id
}
