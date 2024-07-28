# data resource to pull info about eks node group
data "aws_eks_cluster" "production" {
  name = "production_eks_cluster" # Specify the name of your EKS cluster
}

data "aws_eks_node_group" "production" {
  cluster_name = data.aws_eks_cluster.production.name
  node_group_name = "production_eks_node_group"
}