terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.12.0"
    }
  }
  backend "s3" {
    key     = "mb-tf-task/terraform.tfstate"
    region  = "ap-south-1"
    bucket  = "terraform-mb"
    # profile = "default"
    profile = "own"
  }
}

provider "aws" {
  region = var.aws_region
}
