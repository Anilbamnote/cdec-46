
provider "aws"{
    region = "us-east-2"
}




resource "aws_instance" "ec2" {
    for_eac = var.instance_type
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = each.value
    key_name = "ohio-key"
    security_groups = ["default"]
    # count = 3
    tags = {
        # ENV = dev
        Name = "my-workspace-instance-${each.key}"
    }
}

variable "instance_type" {
    default = {
        small = "t2.small"
        micro = "t3.micro"
        nano = "t2.nano"
    }
}


---

## TERRAFORM TAINT
provider "aws" {
    region = "us-east-2"
}




resource "aws_instance" "ec2" {

    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t3.micro"
    key_name = "ohio-key"
    security_groups = ["default"]


    tags = {
        # ENV = dev
        Name = "my-workspace-instance"
    }
 }   


## TERRAFORM IMPORT

provider "aws"{
    region = "us-east-2"
}

 resource "aws_instance" "demo_import" {
    ami = ""
    instance_type = ""

 }



 resource "aws_security_groups" "mysg"{
    Name = my-security_groups
    description = "allow all trafic"
#vpc_security_group_ids = [aws_security_groups.mysg.id]
    tags = {
        default = "mysg"
    }
 }
 ingress {
    from_port = 80
    to_port =80
    protocol = TCP
    cidr_block = ["0.0.0./0"]
 }
 egress {
    to_port= 0
    from_port = 0
    protocol = "-1"
    cidr_block = ["0.0.0.0/0"]
 }