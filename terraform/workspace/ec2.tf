provider "aws" {
  region = "us-east-2"  # Specify the AWS region
}

resource "aws_instance" "my_instance" {
for_each = var.instance_type
  ami             = "ami-088b41ffb0933423f"
  instance_type   = each.value
  key_name        = "ohio-faiz-key"
  security_groups = ["default"]  # Ensure this security group exists
  #count = 2

  tags = {
    ENV = terraform.workspace
    Name = "instace-${each.key}"
  }
}

variable "instance_type" {
    default = {
        small = "t2.small"
        medium = "t2.medium"

    }
  
}