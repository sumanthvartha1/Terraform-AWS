variable "vpc_cidr" {
  description = "cidr range for vpc"
}

variable "public_subnet_cidr" {
  description = "cidr range for public subnet"
}

variable "private_subnet_cidr" {
  description = "cidr range for private subnet"
}


variable "instance_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "owner" {
    type = string
    description = "The owner of the EC2 instance"
}

variable "environment" {
    type = string
    description = "The environment to which the EC2 instance belongs"
}
