module "eks_coredns_addon_creation" {
  source        = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_addon?ref=main"
  cluster_name  = data.aws_eks_cluster.eks_cluster.name
  addon_name    = var.coredns_addon_name
  addon_version = var.coredns_addon_version
}

module "eks_kubeproxy_addon_creation" {
  source        = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_addon?ref=main"
  cluster_name  = data.aws_eks_cluster.eks_cluster.name
  addon_name    = var.kubeproxy_addon_name
  addon_version = var.kubeproxy_addon_version
}

module "eks_awscni_addon_creation" {
  source        = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_addon?ref=main"
  cluster_name  = data.aws_eks_cluster.eks_cluster.name
  addon_name    = var.awscni_addon_name
  addon_version = var.awscni_addon_version
}