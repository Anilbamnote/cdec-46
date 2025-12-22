provider "aws" {
  region = "ap-southeast-2"  # Specify the AWS region
}

resource "aws_instance" "my_instance" {
  ami             = "ami-07ba57196a766fc6d"
  instance_type   = "t2.micro"
  key_name        = "root3.0-key-sydny"
  security_groups = ["default"]  # Ensure this security group exists

  tags = {
    Name = "My-Terraform-Instance"
  }



provisioner "file" {
  source      = "./script.sh"
  destination = "/tmp/script.sh"

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }
}
provisioner "local-exec" {
        command = "echo hurray! Instance Launched: ${self.public_ip} > new.txt"
    }


 provisioner "remote-exec" {
        inline = [
            "sudo -i",
            "bash /tmp/script.sh"
        ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("~/.ssh/id_rsa")
            host = self.public_ip
        }
    }


}