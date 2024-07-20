# Output the node_group_name from the module
output "node_group_name" {
  value = module.eks_launch_template_creation.node_group_name
}

# Output the launch_template_id from the module
output "launch_template_id" {
  value = module.eks_launch_template_creation.launch_template_id
}