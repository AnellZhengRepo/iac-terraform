variable "environment" {
  description = "Environment name"
  type        = string
  default     = "stage"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "tf-s3-example-practice"
}
