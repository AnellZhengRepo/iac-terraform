locals {
  common_tags = {
    Environment = var.environment
    Project     = "iac-terraform-sample"
    Owner       = "DevOps-Team"
  }

  full_bucket_name = "${var.environment}-${var.bucket_name}"
}
