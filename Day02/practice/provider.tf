terraform {
  required_providers {
    aws = {
      source  = var.mysource
      version = var.myversion
    }
  }
}

provider "aws" {
    region = var.region
    profile = var.profile
}
