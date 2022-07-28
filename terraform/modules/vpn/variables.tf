variable "app" {
  type        = string
  description = "Descriptive name"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type where to deploy the VPN software"
  default     = "t3a.small"
}

variable "vpn_port" {
  type        = number
  description = "UDP port where to expose the VPN node"
}
variable "vpn_web_port" {
  type        = number
  description = "TCP port where to expose the VPN web console"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where to deploy the VPN node"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where to deploy the VPN node"
}

