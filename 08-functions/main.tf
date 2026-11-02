# Terraform function usage

# Modifications are executed on "locals.tf", so check that file.
# Execute in console the command "terraform plan" to check if everything is working.
# If everything is OK, execute "terraform output output_variable" to show the results.

# Examples:

# 1- lower(string_value)
# Format string to lower case.

# $ terraform output lower_project_name
# "project terraform functions"

# *** Be sure to use "terraform refresh" when just using "terraform output", due to the fact that this is not being applied,
# so it needs to refresh to show output.

# 2- replace(string_value, "string_to_replace", "string_new_value")
# Change wanted section(s) of a string with new value.

# $ terraform output replace_project_name
# "project-terraform-functions"

# 3- merge("object_1", "object_2")
# Combine the values of 2 objects

resource "aws_s3_bucket" "tf_s3_example" {
  bucket = "tf_s3_example"
  tags = local.merge_tags
}

# terraform plan:
# + tags = {
#         + "company"     = "TechCompany"
#         + "cost_center" = "cc-123"
#         + "environment" = "production"
#         + "managed_by"  = "Terraform"
#       }

# 4- substr("string_value", index_start, index_end)
# Extract the string from certain index to another
# For this case we try to force bucket naming rules like max limit 63 characters, lowercase letters, etc.

resource "aws_s3_bucket" "tf_s3_example_substr" {
  bucket = local.bucket_name
  tags = local.merge_tags
}

# 5- split("separator", "string_value")
# Separate a string into an array

# 6- lookup(map, "string_value_for_lookup", "default_value_if_not_exists")
# Find the value on the map by searching the key given on the string_value_for_lookup.
# If no key found, default_value_if_not_exists will be set