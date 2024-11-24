# resource "aws_security_group" "ec2_sg" {
#   name        = "ec2_security_group"
#   description = "Allow SSH and HTTP inbound traffic"

#   vpc_id = data.aws_vpc.vpc.id

#   # Dynamically create ingress rules for the ports defined in the list
#   dynamic "ingress" {
#     for_each = var.ingress_ports
#     content {
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"] # Update this for tighter access control
#     }
#   }

#   # Egress rule: Allow all outbound traffic
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = merge(var.tags, {
#     Name = format("%s-%s-sg", var.tags["environment"], var.tags["project"])
#   })
# }


resource "aws_security_group" "sg" {
  name        = format("%s-%s-${var.sg_name}", var.tags["environment"], var.tags["project"])
  description = "Allow SSH and HTTP inbound traffic"

  vpc_id = data.aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Update this for tighter access control
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = format("%s-%s-${var.sg_name}", var.tags["environment"], var.tags["project"])
  })
}


