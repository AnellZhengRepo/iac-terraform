# File used to DECLARE variables
# The file to actually set the values is terraform.tfvars
# So no value should be shown here, just the declaration, default is optional

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "stage"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Environment = "stage"
    Name        = "stage-EC2-Instance"
  }
}