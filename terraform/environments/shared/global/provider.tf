provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.aws_default_tags
  }
}

provider "aws" {
  alias = "vpn"

  region = var.aws_region

  default_tags {
    tags = merge(var.aws_default_tags, { "Project" = "VPN" })
  }
}
