module "eks_managed_node_group_creation" {
  source                      = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_managed_node_group?ref=main"
  cluster_name                = data.aws_eks_cluster.eks_cluster.name
  node_group_name             = data.terraform_remote_state.eks_launch_templates.outputs.node_group_name
  node_role_arn               = data.aws_iam_role.eks_production_node_group_role.arn
  subnet_ids                  = [
    data.aws_subnet.default_vpc_public_subnet_1.id,
    data.aws_subnet.default_vpc_public_subnet_2.id,
    data.aws_subnet.default_vpc_private_subnet_1.id,
    data.aws_subnet.default_vpc_private_subnet_2.id
  ]
  desired_size                = var.desired_size
  max_size                    = var.max_size
  min_size                    = var.min_size
  instance_types              = var.instance_types
  aws_launch_template         = data.terraform_remote_state.eks_launch_templates.outputs.launch_template_id
  aws_launch_template_version = var.aws_launch_template_version
  environment                 = var.environment
}