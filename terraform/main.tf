provider "aws" {
  region = "ap-southeast-1"
}



module "aws_instance_basic" {


  source = "./modules/vpc"
}


terraform {
  backend "s3" {
    bucket         = "my-terraform0909-buck"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terra-table"
    encrypt        = true
  }
}