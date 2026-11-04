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

variable "instance_type" {
  default = "t2.micro"

  validation {
    condition = length(var.instance_type) >= 3 && length(var.instance_type) <= 20
    error_message = "Instance type must be between 3 and 20 characters"
  }

  validation {
    condition = can(regex("^t[2-3]\\.", var.instance_type))
    error_message = "Instance must start with t2. or t3."
  }
}

variable "credentials" {
  default = "abcd1234"
  sensitive = false
}

variable "monthly_costs" {
  default = [-50, 100, 75, 200]
}