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

output "certificates_arn" {
  value = {
    testing    = module.testing_certificates
    production = module.production_certificates
  }
}

output "reusable_iam_roles" {
  value = module.reusable_iam_roles
}
