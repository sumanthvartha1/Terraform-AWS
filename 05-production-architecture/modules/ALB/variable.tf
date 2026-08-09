variable "vpc_id" {
  type = string
  description = "The ID of the VPC where the load balancer will be created"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "The IDs of the public subnets where the load balancer will be created"
}

