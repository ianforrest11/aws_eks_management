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
data "aws_security_group" "prod_eks_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_eks_security_group"]
  }
}

# Data block to get the EKS IAM role by name
data "aws_iam_role" "eks_production_role" {
  name = "EKS_Production_Role"
}

# Data block to get the EKS Node Group IAM role by name
data "aws_iam_role" "eks_production_node_group_role" {
  name = "EKS_Production_Node_Group_Role"
}

# Data source to retrieve the EC2 key pair by name
data "aws_key_pair" "prod_eks_ec2_ssh_key" {
  key_name = "prod_eks_ec2_ssh_key"
}
