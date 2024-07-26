module "eks_launch_template_creation" {
  source                        = "git@github.com:ianforrest11/aws_terraform_eks_templates.git//eks_launch_template?ref=main"
  image_id                      = data.aws_ami.eks_kubernetes_worker.id
  ec2_ssh_key                   = data.aws_key_pair.eks_ec2_ssh_key.key_name
  resource_type                 = var.resource_type
  instance_metadata_tags        = var.instance_metadata_tags
  http_endpoint                 = var.http_endpoint
  http_tokens                   = var.http_tokens
  http_put_response_hop_limit   = var.http_put_response_hop_limit
  market_type                   = var.market_type
  node_security_groups          = [
    data.aws_security_group.eks_node_group_security_group.id,
    data.terraform_remote_state.eks_cluster.outputs.cluster_security_group_id
  ]
  node_group_max_size           = var.node_group_max_size
  node_group_name               = var.node_group_name
  update_default_version        = var.update_default_version
  user_data                     = base64encode(<<EOF
      MIME-Version: 1.0
      Content-Type: multipart/mixed; boundary="//"

      --//
      Content-Type: text/x-shellscript; charset="us-ascii"
      #!/bin/bash
      set -ex
      /etc/eks/bootstrap.sh ${data.aws_eks_cluster.eks_cluster.name} --kubelet-extra-args '--node-labels=eks.amazonaws.com/nodegroup-image=${data.aws_ami.eks_kubernetes_worker.id},eks.amazonaws.com/capacityType=${upper(var.market_type)},eks.amazonaws.com/nodegroup=${var.node_group_name} --max-pods=${var.node_group_max_size}' --b64-cluster-ca ${data.aws_eks_cluster.eks_cluster.certificate_authority[0].data} --apiserver-endpoint ${data.aws_eks_cluster.eks_cluster.endpoint} --dns-cluster-ip ${var.k8s_cluster_dns_ip} --use-max-pods false

      --//--
EOF
) 
  environment                   = var.environment
  k8s_cluster_dns_ip            = var.k8s_cluster_dns_ip
}