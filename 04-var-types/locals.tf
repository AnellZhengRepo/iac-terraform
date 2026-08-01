# File used to process, transform, concatenate varibles VALUES

locals {
  common_tags = {
    Environment = var.environment
    Name        = "${var.environment}-EC2-Instance"
    Project     = "iac-terraform-sample"
    Owner       = "DevOps-Team"
  }
}
