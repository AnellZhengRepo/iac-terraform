# File used to DECLARE variables
# The file to actually set the values is terraform.tfvars
# So no value should be shown here, just the declaration, default is optional

variable "project_name" {
  description = "project_name"
  type        = string
  default     = "Project Terraform Functions"
}
