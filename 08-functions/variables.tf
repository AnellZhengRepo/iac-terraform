# File used to DECLARE variables
# The file to actually set the values is terraform.tfvars
# So no value should be shown here, just the declaration, default is optional

variable "project_name" {
  description = "project_name"
  type        = string
  default     = "Project Terraform Functions"
}

variable "default_tags" {
  default = {
    company = "TechCompany"
    managed_by = "Terraform"
  }
}

variable "environment_tags"{
  default = {
    environment = "production"
    cost_center = "cc-123"
  }
}

variable "bucket_name" {
  default = "Test S3bucket using Terraform and functions with CAPS and spaces!!!"
}

variable "allowed_ports" {
  default = "80,443,8080,3306"
  type = string
}

variable "instace_sizes" {
  default = {
    dev = "t2.micro"
    stage = "t3.small"
    prod = "t3.large"
  }
}

variable "environment" {
  default = "stage"
}