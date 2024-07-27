# pull cluster info
data "aws_eks_cluster" "eks_cluster" {
  name = "${var.environment}_eks_cluster"  # Replace with your EKS cluster name
}

# # pull node group name from eks launch template terraform state's output
# # Data source to fetch the remote state
# data "terraform_remote_state" "eks_launch_templates" {
#   backend = "s3"
#   config = {
#     bucket = "iforrest-aws-s3-terraform-state"
#     key    = "${var.environment}/eks_launch_templates"
#     region = "us-east-1"
#     dynamodb_table = "iforrest-aws-dynamodb-terraform-state"
#   }
# }

# Data block to get the EKS Node Group IAM role by name
data "aws_iam_role" "eks_production_node_group_role" {
  name = "EKS_Production_Node_Group_Role"
}

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
