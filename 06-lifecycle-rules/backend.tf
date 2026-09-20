terraform {
  # Before executing, the S3 bucket MUST exist
  backend "s3" {
    bucket       = "tf-s3-state-file-mgmt"
    key          = "sample/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
