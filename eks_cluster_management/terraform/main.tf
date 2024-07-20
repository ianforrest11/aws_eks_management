module "eks_cluster_creation" {
  source                      = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_cluster?ref=main"
  name                        = var.name
  role_arn                    = data.aws_iam_role.eks_production_role.arn
  version                     = var.eks_version
  subnet_ids                  = [
    data.aws_subnet.default_vpc_public_subnet_1.id,
    data.aws_subnet.default_vpc_public_subnet_2.id,
    data.aws_subnet.default_vpc_private_subnet_1.id,
    data.aws_subnet.default_vpc_private_subnet_2.id
  ]
  security_group_ids          = [
    data.aws_security_group.eks_security_group.id
  ]
  environment                 = var.environment
}