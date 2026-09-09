terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.63.0"
    }
  }
}

provider "aws" {
  region = "ap-south-2"
  profile = "dev"
}

terraform {
    backend "s3"{
        bucket = "remote-backend-09092026"
        region = "ap-south-2"
        profile = "dev"
        shared_credentials_files = ["/root/.aws/credentials"]
        key = "terraform.tfstate"
        use_lockfile = true
    }
}