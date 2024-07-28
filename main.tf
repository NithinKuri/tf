provider "aws" {
    region = "us-east-1"

}

resource "aws_instance" "terraform_instance" {
    ami = var.ami
    instance_type = var.type
    key_name = var.key
    tags = {
        "Name" = "terraform"
    }
}

variable "ami" {
  description = "ami of the ec2 instance"
  type = string
  default = "ami-00beae93a2d981137"
}

variable "type" {
  description = "type of instance"
  type = string
  default = "t2.micro"
}

variable "key"{
    description = "key for instance"
    type = string
    default = "newkey"
}

output "ip" {
    value = aws_instance.terraform_instance.public_ip
}