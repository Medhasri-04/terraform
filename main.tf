terraform {
required_providers {
   aws = {
     source = "hashicorp/aws"
     version = "~> 4.16"
   }
}
required_version = ">= 1.2.0"
}
provider "aws" {
region = "ap-south-2"
}
resource "aws_instance" "example" {
ami = "ami-090b9c8aa1c84aefc"
instance_type = "t3.micro"
vpc_security_group_ids = [aws_security_group.example.id]
tags = {
   Name = "my-first-ec2"
}
}
resource "aws_security_group" "example" {
name = "first-sg"
description = "Security group for example application"
vpc_id = "vpc-0f086b12433c3405e"
 
# Ingress Rules (Inbound Traffic)
ingress {
description = "Allow HTTP traffic"
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
description = "Allow SH traffic"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}
resource "aws_s3_bucket" "example" {
  bucket = "medha-first-test-bucket"
 
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
