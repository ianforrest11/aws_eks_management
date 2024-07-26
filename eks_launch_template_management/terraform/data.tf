# pull cluster info
data "aws_eks_cluster" "eks_cluster" {
  name = "${var.environment}_eks_cluster"  # Replace with your EKS cluster name
}

# Data block to get the prod eks security group id by name
data "aws_security_group" "eks_node_group_security_group" {
  filter {
    name   = "group-name"
    values = ["${var.environment}_eks_node_group_security_group"]
  }
}

# latest k8s worker ami
data "aws_ami" "eks_kubernetes_worker" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amazon-eks-node-1.30-v*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["602401143452"]  # Amazon's EKS AMI account ID
}

# Data source to retrieve the EC2 key pair by name
data "aws_key_pair" "eks_ec2_ssh_key" {
  key_name = "${var.environment}_eks_ec2_ssh_key"
}

# get terraform state of eks cluster to retrieve outputs
data "terraform_remote_state" "eks_cluster" {
  backend = "s3"
  config = {
    bucket = "iforrest-aws-s3-terraform-state"
    key    = "${var.environment}/eks_cluster"
    region = "us-east-1"
    dynamodb_table = "iforrest-aws-dynamodb-terraform-state"
  }
}