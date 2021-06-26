provider "aws" {
  region = us-west-1
}

#Create security group with firewall rules
resource "aws_security_group" "security_Redhart_port" {
  name        = "security_Redhat_port"
  description = "security group for RedHart"

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from RedHat server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_RedHat_port"
  }
}

resource "aws_instance" "myWindowsRedHatInstance" {
  ami           = "ami-054965c6cd7c6e462"
  key_name = kofiec2jekinskey2021
  instance_type = var.instance_type
  security_groups= [ "security_RedHat_port"]
  tags= {
    Name = "RedHat_instance"
  }
}

# Create Elastic IP address
resource "aws_eip" "mywindowsRedHatInstance" {
  vpc      = true
  instance = aws_instance.mywindowsRedHatInstance.id
tags= {
    Name = "RedHat_elstic_ip"
  }
}
