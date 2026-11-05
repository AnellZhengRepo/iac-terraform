data "aws_vpc" "tf_data_vpc_example" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnet" "tf_data_subnet_example" {
  filter {
    name   = "tag:Name"
    values = ["subnet-a"]
  }
  vpc_id = data.aws_vpc.tf_data_vpc_example.id
}

data "aws_ami" "tf_data_ami_amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}