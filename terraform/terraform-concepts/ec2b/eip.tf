# Resource for Elastic IP with a Name tag
resource "aws_eip" "jenkins_eip" {
  vpc = true

  tags = {
    "Name"           = "jenkins-master-eip"
    "owner"          = "EK TECH SOFTWARE SOLUTIONS"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

# Associate Elastic IP with EC2 Instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.jenkins_eip.id
}
