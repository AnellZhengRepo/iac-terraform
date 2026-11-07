# Use of data.tf file for datasources.
# Datasource is a way to GET values before any resource creation.
# For example VPC, EC2 AMI, etc.

# We can separate data.tf into more targeted resources for big infrastructures.
# Example vpc.tf, instance.tf, network.tf, etc.
# Terraform will process every .tf file so you can split as many files as you desire.


resource "aws_instance" "tf_ec2_example" {
  ami           = data.aws_ami.tf_data_ami_amazon_linux_2.id
  count = var.instance_count
  # instance_type = "t3.micro"
  instance_type = var.environment == "dev"? "t2.micro" : "t3.micro"
  subnet_id = data.aws_subnet.tf_data_subnet_example.id
  tags = var.ec2_tags
}


