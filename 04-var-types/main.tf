# When executing comand:
# terraform plan
# It uses: terraform.tfvars (IF IT IS CREATED) as MAIN source for variables VALUES.

# Also, you can select specific tfvars to load:
# terraform plan -var-file="dev.tfvars"
# terraform plan -var-file="production.tfvars"

# -----------------------------------------------------------------------------

# Varibles types:
# 1- number: numeric values
# 2- string: words and characters
# 3- boolean: true or false
# 4- list(type): array of values, type can be any of the previous types (ex. list(string or list(number))
# 4- set(type): list of values - IGNORES DUPLICATE VALUES, type can be any of the previous types (ex. set(string or set(number))
# To access the values, transform it to list and then set the indes: tolist(var.varname)[0]
# 5- map(type): key - value object (json), type can be any of the previous types (ex. map(string or map(number))
# 6- tuple(type,type,...): array of values of different types (ex. tuple([number, string, number]))
# 7- object(key,type): json object, declare key with its type and optionally its value (ex.
#     object({
#       key   = type,
#       key = type
#     })

resource "aws_instance" "tf_ec2_example" {
  count         = var.instance_count            # type number
  ami           = var.instance_ami              # type string
  instance_type = var.instance_type             # type string
  region        = tolist(var.allowed_region)[1] # type set(string)

  monitoring                  = var.monitoring_enable   # type boolean
  associate_public_ip_address = var.associate_public_ip # type boolean

  tags = var.ec2_tags # type map(string)
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_block[0]     # type list(string)
  from_port         = var.ingress_values[0] # type tuple([number, string, number]
  ip_protocol       = var.ingress_values[1] # type tuple([number, string, number]
  to_port           = var.ingress_values[2] # type tuple([number, string, number]
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.egress_config.cidr_ipv4   # type object(key,type)
  ip_protocol       = var.egress_config.ip_protocol # type object(key,type) # semantically equivalent to all ports
}
