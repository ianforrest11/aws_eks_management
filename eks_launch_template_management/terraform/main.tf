module "eks_launch_template_creation" {
  source                        = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_launch_template?ref=main"
  image_id                      = data.aws_ami.amazon_linux_2.id
  ec2_ssh_key                   = data.aws_key_pair.eks_ec2_ssh_key.key_name
  resource_type                 = var.resource_type
  http_tokens                   = var.http_tokens
  http_put_response_hop_limit   = var.http_put_response_hop_limit
  node_security_groups          = [
    data.aws_security_group.eks_node_group_security_group.id
  ]
  node_group_name               = var.node_group_name
  environment                   = var.environment
}