terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
  backend "s3" {
    bucket         = "first-demo-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "first-demo-state-table"
  }
}

provider "aws" {
  region = "us-east-2"
}
