# Lifecycles:
# create_before_destroy: Waits until new resource is created and then destroy the old one
# prevent_destroy: If enabled, this resource cannot be destroyed via "terraform destroy".

# resource "aws_instance" "tf_ec2_example" {
#   count         = var.instance_count
#   ami           = var.instance_ami
#   instance_type = var.instance_type
#   region        = var.region

#   tags = var.ec2_tags

#   lifecycle {
#     create_before_destroy = true
#     prevent_destroy = false
#   }
# }

#-----------------------------------------------------------------------------------------------------#

# Lifecycle:
# ignore_changes: add the properties to IGNORE if it does not match or has changed externally.

# Launch Template needed for next resource: aws_autoscaling_group
resource "aws_launch_template" "tf_lauch_template_example" {
  name_prefix   = "tf_lauch_template_example"
  image_id      = var.instance_ami
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.generic_resource_tags,
      {
        Name = "Launch template for AutoSacling Group"
        Demo = "ignore_changes"
      }
    )
  }
}

resource "aws_autoscaling_group" "tf_autoscaling_example" {
  name               = "tf_autoscaling _group_example"
  min_size           = 1
  max_size           = 5
  desired_capacity   = 2
  health_check_type  = "EC2"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  launch_template {
    id      = aws_launch_template.tf_lauch_template_example.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Example AutoScaling Group"
    propagate_at_launch = true
  }

  tag {
    key                 = "Demo"
    value               = "ignore_changes"
    propagate_at_launch = false
  }

  lifecycle {
    ignore_changes = [
      desired_capacity
    ]
  }
}

#-----------------------------------------------------------------------------------------------------#

# Lifecycle:
# replace_triggered_by: replace the resource if the resource in the specified lifecycle (aws_security_group) changes.

resource "aws_security_group" "tf_security_group_example" {
  name        = "tf_security_group_example"
  description = "Security group for EC2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = merge(
    var.generic_resource_tags,
    {
      Name = "EC2 Security Group"
      Demo = "replace_triggered_by"
    }
  )
}

resource "aws_instance" "tf_ec2_example" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.tf_security_group_example.id]

  tags = merge(
    var.generic_resource_tags,
    {
      Name = "EC2 triggered by security group"
      Demo = "replace_triggered_by"
    }
  )

  lifecycle {
    replace_triggered_by = [
      aws_security_group.tf_security_group_example.id
    ]
  }
}

#-----------------------------------------------------------------------------------------------------#

# Lifecycle:
# precondition: executes BEFORE the creation of resource. Have 2 values: condition and error_message
# condition: what to check
# error_message: print information if condition matches

resource "aws_s3_bucket" "tf-s3-example-precondition" {
  bucket = "tf-s3-example-precondition-${var.environment}-${var.region}"

  tags = merge(
    var.generic_resource_tags,
    {
      Name = "Validate region for bucket"
      Demo = "precondition"
    }
  )

  lifecycle {
    precondition {
      condition     = contains(var.list_allowed_regions, var.region)
      error_message = "ERROR: This resource can only be created in allowed regions: ${join(", ", var.list_allowed_regions)}. Current region: ${var.region}"
    }
  }
}


#-----------------------------------------------------------------------------------------------------#

# Lifecycle:
# postcondition: executes AFTER the creation of resource. 2 values: condition and error_message
# condition: what to check
# error_message: print information if condition matches

# resource "aws_s3_bucket" "tf-s3-example-postcondition" {
#   bucket = "tf-s3-example-postcondition-${var.environment}-${var.region}"

#   tags = merge(
#     var.generic_resource_tags,
#     {
#       Name       = "Post condition Bucket"
#       Demo       = "postcondition"
#       Compliance = "SOC2"
#     }
#   )

#   lifecycle {
#     postcondition {
#       condition     = contains(keys(var.generic_resource_tags), "Compliance")
#       error_message = "ERROR: Bucket must have a 'Compliance' tag for audit purposes!"
#     }

#     postcondition {
#       condition     = contains(keys(var.generic_resource_tags), "Environment")
#       error_message = "ERROR: Bucket must have an 'Environment' tag!"
#     }
#   }
# }