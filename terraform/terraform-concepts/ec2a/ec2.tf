# Use the first subnet ID from the list of subnets
resource "aws_instance" "my_ec2_instance" {
  ami                    = "ami-0866a3c8686eaeeba"  # Amazon Linux 2 AMI (change as needed)
  instance_type          = "t2.micro"               # Choose instance type
  key_name               = "Dwanj"          # Provide the name of your key pair
  subnet_id              = data.aws_subnet.subnet_01.id # Assign the first available subnet ID

  # Security group association
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

   # Increase root volume to 30 GB and set to gp3
  root_block_device {
    volume_size = 30         # Set the root volume size to 30 GB
    volume_type = "gp3"      # Set the volume type to gp3
  }

   # Optional tags
    tags = {
    "Name"           = "apache-web"
    "owner"          = "EK TECH SOFTWARE SOLUTIONS"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
