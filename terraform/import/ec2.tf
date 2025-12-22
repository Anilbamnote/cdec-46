# provider "aws" {
#     region = "us-east-1"
# }

provider "aws" {
  region = "us-west-2"  # Specify the AWS region
}

resource "aws_instance" "my_instance" {
  ami             = "ami-00f46ccd1cbfb363e"
  instance_type   = "t3.micro"
  key_name        = "soheb-ore-key"
  security_groups = ["default"]  # Ensure this security group exists

  tags = {
    Name = "My-Terraform-Instance"
  }
}








# provider "aws" {
#   region = "ap-southeast-2"  # Specify the AWS region
# }

resource "aws_instance" "demo_import_instance" {
    instance_type = ""
    ami = ""
}



