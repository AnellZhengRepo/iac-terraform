# Conditional Expressions:
# Behave as a true or false condition.
# Syntax: object = variable == "condition"? "value_true" : "value_false"
# Meaning that: "object" will be assigned "value_true", if "variable" is equal to "condition", otherwise "value_false" will be assigned. 

resource "aws_instance" "tf_ec2_example" {
  ami           = "ami-0ff8a91507f77f867"
  count = var.instance_count
  
  # instance_type = "t3.micro"
  instance_type = var.environment == "dev"? "t2.micro" : "t3.micro"

  tags = var.ec2_tags
}


# Dynamic Block
# Mostrly used when object is a list
# Usage: Implement "dynamic" in front of the object, the object will now be closed in quotes ("").
# Next, implement for_each to the variable containing the list declaration.
# Add "content" and grap all the key values inside curly braces.
# When assigning the values, you have to use the object name to reach it, in this case is "ingress".
# Ex. ingress.value.name_of_variable.

resource "aws_security_group" "tf_ingress_rule_example" {
  name   = "tf_ingress_sg_example"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress  = []
}


# Splat Expression
# Use asterisk or star (*) when calling an object that have indexes or counts.
# The meaning of using it is to get every value of the object.
# In this example is calling all the ids of EC2 that will be created.

locals {
  all_ec2_instance_ids = aws_instance.tf_ec2_example[*].id
}

output "e2_instance_ids" {
  value = local.all_ec2_instance_ids
}