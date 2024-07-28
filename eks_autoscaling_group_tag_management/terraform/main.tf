module "eks_autoscaling_group_tag_creation" {
  source                      = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_autoscaling_group_tag?ref=main"
  node_group_name             = data.aws_eks_node_group.production_eks_node_group.node_group_name
}