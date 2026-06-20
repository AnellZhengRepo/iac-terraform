resource "aws_s3_bucket" "tf_s3_example" {
  bucket = local.full_bucket_name # Local variable (computed)

  tags = local.common_tags # Local variable (tags)
}

# When executing comand:
# terraform plan
# It uses: terraform.tfvars (IF IT IS CREATED)

# You can select specific tfvars to load:
# terraform plan -var-file="dev.tfvars"
# terraform plan -var-file="production.tfvars"