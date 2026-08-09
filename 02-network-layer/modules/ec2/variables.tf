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

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be launched"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the public subnet where the EC2 instance will be launched"
  type        = string
}
