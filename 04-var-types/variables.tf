# File used to DECLARE variables
# The file to actually set the values is terraform.tfvars
# So no value should be shown here, just the declaration, default is optional

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "stage"
}

variable "region" {
  description = "Region name"
  type        = string
  default     = "us-east-1"
}

variable "allowed_region" {
  description = "List of allowed regions"
  type        = set(string)
  default     = ["us-east-1", "us-east-2", "us-west-2"]
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_ami" {
  description = "EC2 instance ami"
  type        = string
  default     = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "monitoring_enable" {
  description = "Enable detailed monitoring on EC2 instances"
  type        = bool
  default     = true
}

variable "associate_public_ip" {
  description = "Associate public IP address with EC2 instances"
  type        = bool
  default     = true
}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = list(string)
  default     = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Environment = "stage"
    Name        = "stage-EC2-Instance"
  }
}

variable "ingress_values" {
  type    = tuple([number, string, number])
  default = [443, "tcp", 443]
}

variable "egress_config" {
  type = object({
    cidr_ipv4   = string,
    ip_protocol = string
  })
  default = {
    cidr_ipv4   = "0.0.0.0/0",
    ip_protocol = "-1"
  }
}
