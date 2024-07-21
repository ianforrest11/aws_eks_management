output "kubeconfig" {
  value = <<EOF
apiVersion: v1
clusters:
- cluster:
    server: ${module.eks_cluster_creation.cluster_endpoint}
    certificate-authority-data: ${base64encode(module.eks_cluster_creation.cluster_certificate_authority_data)}
  name: ${var.name}
contexts:
- context:
    cluster: ${var.name}
    user: aws
  name: ${var.name}
current-context: ${var.name}
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - ${var.name}
EOF
  sensitive = true
}

output "cluster_endpoint" {
  value = module.eks_cluster_creation.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "The security group ID created by EKS for the cluster."
  value       = module.eks_cluster_creation.cluster_security_group_id
}