
terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=6.0"
    }
  }

  # remote backend
  backend "s3" {
  bucket = "tf-bucket-backend-prov-mjemfm"
  key = "vpc/dev/terraform.tfstate"
  region = "us-east-2"
  use_lockfile = true
  }
}


provider "aws" {
    region = var.aws_region
}