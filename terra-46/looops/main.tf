provider "aws" {
  region = "us-west-2"  # Specify the AWS region
}

resource "aws_instance" "my_instance" {
  ami             = "ami-00f46ccd1cbfb363e"
  instance_type   = "t3.micro"
  key_name        = "ore-new"
  security_groups = ["default"]  # Ensure this security group exists

  tags = {
    ENV = terraform.tfstatefile
    Name = "My-Terraform-Instance"
  }
}