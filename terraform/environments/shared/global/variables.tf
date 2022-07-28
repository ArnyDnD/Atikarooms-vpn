variable "aws_region" {
  type        = string
  description = "AWS default region"
}

variable "aws_default_tags" {
  type        = map(any)
  description = "Default tags to attach to the AWS provider"
  default     = {}
}

# Admin Networking
variable "adminet_vpc_cidr" {
  type        = string
  description = "VPC CIDR of the Admin Services networking infrastructure"
}
variable "adminet_public_cidrs" {
  type        = list(string)
  description = <<EOT
  IPv4 CIDR blocks of the public subnets.

  Blocks must be in between of /16 and /28, both included.
  Should be of the same size as the 'availability_zones' variable.

  Example: ["10.0.0.0/24", "10.0.0.1/24"]
  EOT
}
variable "adminet_airgapped_cidrs" {
  type        = list(string)
  description = <<EOT
  IPv4 CIDR blocks of the airgapped subnets (no Internet/NAT at all).

  Blocks must be in between of /16 and /28, both included.
  Should be of the same size as the 'availability_zones' variable.

  Example: ["10.0.0.0/24", "10.0.0.1/24"]
  EOT
}

# VPN node
variable "vpn_port" {
  type        = number
  description = "UDP port where to expose the VPN node"
}
variable "vpn_web_port" {
  type        = number
  description = "TCP port where to expose the VPN web console"
}
