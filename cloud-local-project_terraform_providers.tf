terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = var.region
  access_key                  = "test"
  secret_key                  = "test"
  s3_use_path_style           = true

  endpoints {
    s3        = "http://localhost:4566"
    iam       = "http://localhost:4566"
    cloudwatch= "http://localhost:4566"
    logs      = "http://localhost:4566"
  }
}