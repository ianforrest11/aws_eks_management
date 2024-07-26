module "eks_launch_template_creation" {
  source                        = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_launch_template?ref=main"
  image_id                      = data.aws_ami.eks_kubernetes_worker.id
  ec2_ssh_key                   = data.aws_key_pair.eks_ec2_ssh_key.key_name
  resource_type                 = var.resource_type
  iam_instance_profile          = data.aws_iam_instance_profile.eks_production_node_group_role_instance_profile.name
  instance_metadata_tags        = var.instance_metadata_tags
  http_endpoint                 = var.http_endpoint
  http_tokens                   = var.http_tokens
  http_put_response_hop_limit   = var.http_put_response_hop_limit
  node_security_groups          = [
    data.aws_security_group.eks_node_group_security_group.id,
    data.terraform_remote_state.eks_cluster.outputs.cluster_security_group_id
  ]
  node_group_name               = var.node_group_name
  environment                   = var.environment
}