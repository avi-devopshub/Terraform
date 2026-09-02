terraform {
  required_providers {
    aws = {
      source  = var.source
      version = var.version
    }
  }
}

provider "aws" {
    region = var.region
    profile = var.dev
}
