# Global Variables
variable "instance_metadata_tags" {}
variable "resource_type" {}
variable "http_tokens" {}
variable "http_put_response_hop_limit" {}
variable "http_endpoint" {}
variable "update_default_version" {}

# set environment
variable "environment" {}

# environment-specific variables
variable "node_group_max_size" {}
variable "node_group_name" {}
variable "k8s_cluster_dns_ip" {}
variable "market_type" {}