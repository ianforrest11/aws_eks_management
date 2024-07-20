# data block to get private subnet id for use in creating other assets
data "aws_subnet" "default_vpc_private_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["default_vpc_private_subnet_1"]
  }
}

# data block to get public subnet id for use in creating other assets
data "aws_subnet" "default_vpc_public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["default_vpc_public_subnet_1"]
  }
}

# data block to get private subnet id for use in creating other assets
data "aws_subnet" "default_vpc_private_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["default_vpc_private_subnet_2"]
  }
}

# data block to get public subnet id for use in creating other assets
data "aws_subnet" "default_vpc_public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["default_vpc_public_subnet_2"]
  }
}

# Data block to get the prod eks security group id by name
data "aws_security_group" "eks_security_group" {
  filter {
    name   = "group-name"
    values = ["${var.environment}_eks_security_group"]
  }
}

# Data block to get the EKS IAM role by name
data "aws_iam_role" "eks_production_role" {
  name = "EKS_Production_Role"
}