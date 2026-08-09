variable "vpc_id" {
    type = string   
    description = "The ID of the VPC where the security group will be created"
  
}

variable "project_name" {
    type = string
    description = "The name of the project for which the security group is being created"
}

variable "environment" {
    type = string
    description = "The environment to which the security group belongs (e.g., dev, staging, prod)"
}

variable "owner" {
    type = string
    description = "The owner of the security group"
}