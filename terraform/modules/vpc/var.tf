variable "key_name" {
   default = "ore-adi"
  
}

variable "instance_type" {
    default = "t2.micro"
  
}

variable "image_id" {
   default = "ami-075686beab831bb7f"

  
}

variable "pub_cidr" {
   default = "10.0.0.0/20"
  
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}


# variable "vpc_cidr" {}
# variable "pub_cidr" {}
# variable "image_id" {}
# variable "instance_type" {}
# variable "key_name" {}