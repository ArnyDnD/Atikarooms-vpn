data "aws_vpc" "corenet_testing" {
  tags = {
    Name = "ar-corenet-testing-vpc"
  }
}
data "aws_route_table" "corenet_private_testing" {
  tags = {
    Name = "ar-corenet-testing-private-rt"
  }
}
data "aws_route_table" "adminet_public" {
  tags = {
    Name = "ar-adminet-public-rt"
  }
}
data "aws_security_group" "public_ingress" {
  name = "k3s-testing-eu-west-1-public-ingress-security-group"
}
data "aws_security_group" "private_ingress" {
  name = "k3s-testing-eu-west-1-private-ingress-security-group"
}

# VPC Peering
resource "aws_vpc_peering_connection" "adminet_to_corenet_testing" {
  vpc_id      = module.adminet.vpc_id
  peer_vpc_id = data.aws_vpc.corenet_testing.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "adminet_to_corenet_testing"
  }
}

# Add peering to RTs
resource "aws_route" "to_corenet_testing" {
  route_table_id            = data.aws_route_table.adminet_public.id
  destination_cidr_block    = data.aws_vpc.corenet_testing.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.adminet_to_corenet_testing.id
}

resource "aws_route" "to_adminet" {
  route_table_id            = data.aws_route_table.corenet_private_testing.id
  destination_cidr_block    = var.adminet_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.adminet_to_corenet_testing.id
}

# Add PL to ingress SGs
resource "aws_security_group_rule" "vpn_to_testing_private_ingress" {
  for_each = toset(["80", "443"])

  security_group_id = data.aws_security_group.private_ingress.id

  type            = "ingress"
  description     = "From VPN"
  from_port       = each.value
  to_port         = each.value
  protocol        = "tcp"
  prefix_list_ids = [module.vpn.prefix_list_id]
}
resource "aws_security_group_rule" "vpn_to_testing_public_ingress" {
  for_each = toset(["80", "443"])

  security_group_id = data.aws_security_group.public_ingress.id

  type            = "ingress"
  description     = "From VPN"
  from_port       = each.value
  to_port         = each.value
  protocol        = "tcp"
  prefix_list_ids = [module.vpn.prefix_list_id]
}
