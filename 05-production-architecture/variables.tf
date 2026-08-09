variable "vpc_cidr" {
  description = "cidr range for vpc"
}

variable "public_subnet1_cidr" {
  description = "cidr range for public subnet 1"
}

variable "public_subnet2_cidr" {
  description = "cidr range for public subnet 2"
}

variable "private_subnet1_cidr" {
  description = "cidr range for private subnet 1"
}

variable "private_subnet2_cidr" {
  description = "cidr range for private subnet 2"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
}
variable "instance_type" {
  description = "EC2 instance type"
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
}

variable "project_name" {
  description = "Name of the project"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
}

variable "owner" {
  description = "Owner of the resources"
}

