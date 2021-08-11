provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "mysubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"
}

  resource "aws_instance" "web" {
    ami                    = var.ami
    instance_type          = var.instance_type
    key_name               = "myk1"
    vpc_security_group_ids = ["${aws_security_group.websg.id}"]
    subnet_id              = aws_subnet.mysubnet.id

  }


resource "aws_security_group" "websg" {
  name        = "terraform_example"
  description = "Used in the terraform"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}