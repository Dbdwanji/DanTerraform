# # Resource for Elastic IP with a Name tag
# resource "aws_eip" "jenkins_eip" {
#   vpc = true

#   tags = var.tags
# }

# Resource for Elastic IP with a Name tag
resource "aws_eip" "jenkins_eip" {
  vpc = true

  tags = merge(var.tags, {
    Name  = "jenkins_master_eip"
    wanji = "s8wanji"
  })
}
# Associate Elastic IP with EC2 Instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.jenkins_eip.id
}
