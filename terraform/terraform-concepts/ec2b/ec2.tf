# Use the first subnet ID from the list of subnets
resource "aws_instance" "ec2" {
  ami           = data.aws_ami.jenkins_master_ami.id      # Amazon Linux 2 AMI (change as needed)
  instance_type = "t2.micro"                   # Choose instance type
  key_name      = "Dwanj"                      # Provide the name of your key pair
  subnet_id     = data.aws_subnet.subnet_01.id # Assign the first available subnet ID

  # Security group association
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # Increase root volume to 30 GB and set to gp3
  root_block_device {
    volume_size = 30    # Set the root volume size to 30 GB
    volume_type = "gp3" # Set the volume type to gp3
  }

  # User data script to install Apache on Ubuntu
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              EOF

  # Optional tags
  tags = {
    "Name"           = "jenkins-master"
    "owner"          = "EK TECH SOFTWARE SOLUTIONS"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
