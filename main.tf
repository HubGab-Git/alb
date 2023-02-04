terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

# data "aws_default_vpc" "default" {
#   region = "eu-west-1"
# }