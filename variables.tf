variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-wset-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "kofiec2jekinskey2021"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}