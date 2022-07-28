output "vpc_flow_logs_storage" {
  value       = module.vpc_flow_logs_storage
  description = "VPC Flow Logs Storage module output"
}

output "adminet" {
  value       = module.adminet
  description = "Networking module output"
}

output "vpn" {
  value = module.vpn
}
