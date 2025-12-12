#<BLOCK_TYPE> <RESOURCE_TYPE> <BLOCK_NAME>


provider "aws" {
    region = "us-west-2"

}



resource "aws_security_group" "my-sg"{

    name = "my-sg"
    description = "Allow TLS inbound traffic and all outbound traffic"


     tags = {
    Name = "my-sg"
  }


    ingress {

        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"] 

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
}


resource "aws_instance" "my-ce2" {
   ami = var.image_id
   instance_type = var.instance_type
   key_name = var.key_pair
   #security_groups = ["default"]
   vpc_security_group_ids = [aws_security_group.my-sg.id]

   user_data = <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd

   EOF

   tags = {

    Name= "my-tf-server"
   }


}


output "instance_public_ip"{
    value = aws_instance.my-ce2.public_ip
}


variable "image_id"{
    type= string
    default = "ami-0ebf411a80b6b22cb"
}

variable "instance_type" {
    default =  "t3.micro"
}


variable "key_pair" {
    default = "ore-new"
}