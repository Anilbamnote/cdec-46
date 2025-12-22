provider "aws" {
    region = "eu-west-2"
  
}

module "ec2-instance_basic" {
    source = "./modules/ec2-instance" #vpc
  
  # vpc_cidr = "var.vpc_cidr"
  # key_name      = "var.key_name"
  # instance_type = "var.instance_type"
  # image_id      = "var.image_id"
  # pub_cidr    = "var.pub_cidr" 

}

# module "ec2-instance_basic" {
#     source = "./modules/ec2-instance" 
#      #ce2-----demo--instance--main,var,output
#      # source ="/.modules/instance
# }


module "ec2-instance_basic" {
  source = "./modules/ec2-instance"

  vpc_cidr      = var.vpc_cidr
  key_name      = var.key_name
  instance_type = var.instance_type
  image_id      = var.image_id
  pub_cidr      = var.pub_cidr
}





# terraform {
#   backend "s3" {
#     bucket = "my-terra-bucket00999"
#     key    = "tf-state/terraform.tfstate"
#     region = "eu-west-2"
#     dynamodb_table = "my-terra-table"
#   }
# }




terraform {
  backend "s3" {
    bucket         = "new-demo-s3-backend09"
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "new"
  }
}
