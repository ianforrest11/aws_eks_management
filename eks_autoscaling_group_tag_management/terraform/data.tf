# data resource to pull info about eks node group
data "aws_eks_cluster" "production_eks_cluster" {
  name = "production_eks_cluster" # Specify the name of your EKS cluster
}

data "aws_eks_node_group" "production_eks_node_group" {
  cluster_name = data.aws_eks_cluster.production_eks_cluster.name
  node_group_name = "production_eks_node_group"
}