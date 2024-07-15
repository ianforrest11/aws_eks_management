module "eks_cluster_creation" {
  source              = "git@github.com:ianforrest11/terraform_templates.git//aws/eks_cluster?ref=main"
  desired_size        = var.prod_desired_size
  ec2_ssh_key         = var.prod_ec2_ssh_key
  environment         = var.prod_environment
  instance_types      = var.prod_instance_types
  max_size            = var.prod_max_size
  min_size            = var.prod_min_size
  name                = var.prod_name
  node_group_name     = var.prod_node_group_name
  node_role_arn       = data.aws_iam_role.eks_production_node_group_role.arn
  role_arn            = data.aws_iam_role.eks_production_role.arn
  security_group_ids  = [
    data.aws_security_group.prod_eks_security_group.id
  ]
  subnet_ids          = [
    data.aws_subnet.default_vpc_private_subnet_1.id,
    data.aws_subnet.default_vpc_public_subnet_1.id
  ]
  version            = var.prod_version
}
