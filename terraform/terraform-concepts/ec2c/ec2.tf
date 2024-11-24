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
  # tags = merge(var.tags, {
  #   Name = "jenkins-master"
  # })

  # tags = merge(var.tags, {
  #   Name = format("%s-%s-jenkins-master", var.tags["environment"], var.tags["project"])
  # })

   # tags = merge(var.tags, {
  #   Name = format("%s-%s-var.resource_type", var.tags["environment"], var.tags["project"])
  # })

 #   tags = {
#   name          = "${var.tags["environment"]}-${var.tags["project"]}-jenkins-master"
#   owner         = var.tags["owner"]
#   environment   = var.tags["environment"]
#   project       = var.tags["project"]
#   create_by     = var.tags["create_by"]
#   cloud_provider = var.tags["cloud_provider"]
#  }

   tags = {
  name          = "${var.tags["environment"]}-${var.tags["project"]}-${"var.resource_type"}"
  owner         = var.tags["owner"]
  environment   = var.tags["environment"]
  project       = var.tags["project"]
  create_by     = var.tags["create_by"]
  cloud_provider = var.tags["cloud_provider"]
 }
}

