terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }

  backend "s3" {
    bucket       = "kpr-tf-statefile"
    key          = "kpr-terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # 👈 Enables S3 Native State Locking
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}