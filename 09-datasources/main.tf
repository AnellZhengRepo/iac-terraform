
resource "aws_instance" "tf_ec2_example" {
  ami           = data.aws_ami.tf_data_ami_amazon_linux_2.id
  count = var.instance_count
  # instance_type = "t3.micro"
  instance_type = var.environment == "dev"? "t2.micro" : "t3.micro"
  subnet_id = data.aws_subnet.tf_data_subnet_example.id
  tags = var.ec2_tags
}


