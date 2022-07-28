variable "app" {
  type        = string
  description = "Representative name to which tag the resources"
}

variable "vpc_cidr_block" {
  type        = string
  description = <<EOT
  IPv4 CIDR block of the VPC.

  Blocks must be in between of /16 and /28, both included.

  Example: 10.0.0.0/16
  EOT
}

variable "public_subnets_cidr_blocks" {
  type        = list(string)
  description = <<EOT
  IPv4 CIDR blocks of the public subnets.

  Blocks must be in between of /16 and /28, both included.

  Example: ["10.0.0.0/24", "10.0.0.1/24"]
  EOT
}

variable "airgapped_subnets_cidr_blocks" {
  type        = list(string)
  description = <<EOT
  IPv4 CIDR blocks of the air gapped subnets (no Internet/NAT at all).

  Blocks must be in between of /16 and /28, both included.
  Should be of the same size as the 'availability_zones' variable.

  Example: ["10.0.0.0/24", "10.0.0.1/24"]
  EOT
}

variable "vpc_flow_logs_destination_s3_arn" {
  type        = string
  description = "S3 Bucket ARN where to store VPC Flow Logs"
}
