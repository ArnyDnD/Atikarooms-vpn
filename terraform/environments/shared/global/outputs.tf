output "vpc_flow_logs_storage" {
  value       = module.vpc_flow_logs_storage
  description = "VPC Flow Logs Storage module output"
}

output "vpn" {
  value = module.vpn
}

output "domains" {
  value = module.domains
}

output "reusable_iam_roles" {
  value = module.reusable_iam_roles
}
