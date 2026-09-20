resource "aws_s3_bucket" "tf_s3_example_list" {

  count  = 2
  bucket = var.bucket_names_list[count.index] # This will automatically create 2 S3 bucket (based on count variable) by looping the LIST "bucket_names" in variables.tf
  tags   = var.ec2_tags
}


resource "aws_s3_bucket" "tf_s3_example_set" {

  for_each  = var.bucket_names_set
  bucket = each.value # This will automatically create 2 S3 bucket (based on count variable) by looping the SET "bucket_names_set" in variables.tf
  tags   = var.ec2_tags

  depends_on = [ aws_s3_bucket.tf_s3_example_list ] # Adding depends_on hold the execution until the resource "aws_s3_bucket.tf_s3_example_list" has completeed, to then start this resorce execution.
}