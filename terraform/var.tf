variable "cidr_block_" {
  default = "10.0.0.0/18"

}
variable "pub-sub" {
  default = "10.0.0.0/20"

}

variable "image_id" {
  default = "ami-0cbf43fd299e3a464"

}


variable "instance_type" {
  default = "t2.micro"

}

variable "key_name" {
  default = "landon-faiz-key"

}