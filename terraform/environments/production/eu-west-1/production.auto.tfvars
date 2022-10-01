# Provider
aws_region = "eu-west-1"
aws_default_tags = {
  Billing              = "AR Architecture Dept"
  Project              = "Admin Infrastructure"
  Environment          = "Production"
  Terraform-Managed    = true
  Terraform-Repository = "https://github.com/ArnyDnD/Atikarooms-admin-services/tree/main/"
}

# Admin Networking
adminet_vpc_cidr        = "10.5.0.0/16"
adminet_public_cidrs    = ["10.5.10.0/24", "10.5.11.0/24", "10.5.12.0/24"]
adminet_airgapped_cidrs = ["10.5.30.0/24", "10.5.31.0/24", "10.5.32.0/24"]
