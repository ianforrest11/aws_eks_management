# pull cluster info
data "aws_eks_cluster" "eks_cluster" {
  name = "${var.environment}_eks_cluster"  # Replace with your EKS cluster name
}