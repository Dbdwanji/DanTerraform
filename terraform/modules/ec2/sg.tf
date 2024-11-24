# # Security group to allow SSH access
# resource "aws_security_group" "ec2_sg" {
#   name        = "ec2_security_group"
#   description = "Allow SSH and HTTP inbound traffic"

#   vpc_id = data.aws_vpc.vpc.id
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Update this for tighter access control
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Update this for tighter access control
#   }

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Update this for tighter access control
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   #   tags = merge(var.tags, {
#   #   Name = "ec2_security_group"
#   # })

#   tags = merge(var.tags, {
#     Name = format("%s-%s-sg", var.tags["environment"], var.tags["project"])
#   })

# }


