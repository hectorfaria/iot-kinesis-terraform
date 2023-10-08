terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    aws3 = {
      source  = "rgeraskin/aws3"
      version = "2.64.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
