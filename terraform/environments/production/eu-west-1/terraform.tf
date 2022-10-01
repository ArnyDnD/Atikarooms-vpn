terraform {
  backend "s3" {
    bucket = "atikaroom-tf-states"
    key    = "admin-services/production/eu-west-1/terraform.state"
    region = "eu-west-1"
  }
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.33"
    }
  }
}
