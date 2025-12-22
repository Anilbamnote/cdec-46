







# <BLOCK_TYPE> < RESOURCE_TYPE> < BLOCK_NAME> {
#CONFIGURATION
# } 
#/*--------*/ or ctrl+/ --all block comment

provider "aws" {
  region = "ap-southeast-2" # Specify the AWS region
}

resource "aws_instance" "my_instance" {
  ami             = "ami-07ba57196a766fc6d"
  instance_type   = "t2.micro"
  key_name        = "root3.0-key-sydny"
  security_groups = ["default"] # Ensure this security group exists

  tags = {
    Name = "My-Terraform-Instance"
  }
}




/*
resource "aws_instance" "my_instance" {

}

# <BLOCK_TYPE> <RESOURCE_TYPE> <BLOCK_NAME> {
#     # Configuration
# }
*/

provider "aws" {
  region = "ap-southeast-2"
}

data "aws_subnet" "my_subnet" {
  id = var.subnet_id
}

resource "aws_bucket" "new_bucket" {
  name   = "my-on-cdec-bux"
  region = "us-east-1"
  depends_on = [
    aws_instance.instance_1
  ]
}

resource "aws_security_group" "my_sg" {
  name        = "my-sg"
  description = "allow HTTP Port"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "instance_1" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_pair
  #    security_groups = var.sg_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  subnet_id              = var.subnet_id
  user_data              = <<-EOF
        #!/bin/bash
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
    EOF
}

variable "image_id" {
  type        = string
  default     = "ami-07ba57196a766fc6d"
  description = "Enter AMI ID"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair" {
  default = "new-key-nv"
}

variable "subnet_id" {
  default = "subnet-091678d44aa5db41d"
}

# variable "sg_name" {
#     type = list
#     default = ["default"]
# }

output "demo" {
  value = "Hello World"
}

output "public_ip" {
  value = aws_instance.instance_1.public_ip
}

output "arn_subnet" {
  value = data.aws_subnet.my_subnet.arn
}



resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub-sub
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-sub"
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

}

resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.main.id

  tags = {
    Name : "my_custome_instance"
  }

}


resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



provider "aws" {
  region = "ap-southeast-2"

}

resource "aws_instance " "myec2" {
  ami             = ""
  key_name        = ""
  instance_type   = ""
  security_groups = ["default"]


  tags = {
    Name = "my-instance"
  }

}






variable "image_id" {
  type        = string
  default     = "value"
  description = "enter ami id"

}

resource "aws_security_group" "my_sg" {


}

















/*
data type:-

string: "anilbamnotel"
number: 123455
bool: true/false ,0/1

list: ["applet","mango","banana",21545,"apple,""orange"] ---changes

set:{"applet","mango","banana",21545,"orange"}   ----duplicate values not alllowed ,unique vale store repated value not allaowed
tuples: ["applet","mango","banana",21545,"orange"] ------not changes tuples ------in script

map: {fruit="apply",name="anil",address="nagpur"} ----
*/
