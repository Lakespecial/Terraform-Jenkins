variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     = "t2.micro"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}

variable "ami" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-09a56048b08f94cdf"
}