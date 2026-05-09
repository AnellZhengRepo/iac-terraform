terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure S3 bucket
resource "aws_s3_bucket" "tf_s3_example" {
  bucket = "tf-s3-example-practice"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}