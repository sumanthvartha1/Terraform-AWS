variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
}

variable "public_subnet1_cidr" {
  description = "CIDR block for the public subnet"
  type = string
}   

variable "public_subnet2_cidr" {
  description = "CIDR block for the public subnet"
  type = string
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the private subnet 1"
  type = string
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the private subnet 2"
  type = string
}

variable "project_name" {
  description = "Name of the project"
  type = string
} 

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type = string
}