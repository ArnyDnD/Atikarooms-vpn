# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.app}-vpc"
  }
}

# Internet gateway for the public subnets
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.app}-igw"
  }
}

# VPC's Default Security Group
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Default ingress rule"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = "true"
    description = "Default egress rule"
  }

  tags = {
    Name = "${var.app}-default-sg"
  }
}

# VPC's Default Network ACL
resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id

  subnet_ids = concat(
    [for subnet in aws_subnet.public : subnet.id],
    [for subnet in aws_subnet.airgapped : subnet.id]
  )

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.app}-default-acl"
  }
}
