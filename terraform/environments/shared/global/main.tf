module "vpc_flow_logs_storage" {
  source = "../../../modules/vpc_flow_logs_storage"

  app = "admin-services"
}

module "adminet" {
  source = "../../../modules/network"

  app = "ar-adminet"

  vpc_cidr_block                = var.adminet_vpc_cidr
  public_subnets_cidr_blocks    = var.adminet_public_cidrs
  airgapped_subnets_cidr_blocks = var.adminet_airgapped_cidrs

  vpc_flow_logs_destination_s3_arn = module.vpc_flow_logs_storage.s3_bucket_arn
}

module "domains" {
  source = "../../../modules/domains"
}

module "reusable_iam_roles" {
  source = "../../../modules/reusable_iam_roles"
}

module "vpn" {
  source = "../../../modules/vpn"

  providers = {
    aws = aws.vpn
  }

  app          = "ar-vpn"
  vpn_port     = var.vpn_port
  vpn_web_port = var.vpn_web_port
  vpc_id       = module.adminet.vpc_id
  subnet_id    = module.adminet.subnets.public[0].id
}
