variable "ingress_ports" {
  description = "List of ports to ingress inbound traffic"
  type        = list(number)
}

variable "aws_region" {
    type = string
}

variable "sg_name" {
    type = string
}

variable "tags" {
    type = map(string)
}
 


