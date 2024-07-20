# Data block to get the prod eks security group id by name
data "aws_security_group" "eks_node_group_security_group" {
  filter {
    name   = "group-name"
    values = ["${var.environment}_eks_node_group_security_group"]
  }
}

# look up latest ami for amazon linux 2
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

# Data source to retrieve the EC2 key pair by name
data "aws_key_pair" "eks_ec2_ssh_key" {
  key_name = "${var.environment}_eks_ec2_ssh_key"
}