variable "private_subnet_ids" {
  description = "private subnet IDs for ASG"
  type = list(string)
}

variable  "security_group_id" {
  description = "security group ID for EC2 instances"
  type = string
}

variable "target_group_arn" {
  description = "target group ARN for ALB"
  type = string
}

variable "instance_type" {
  description = "EC2 instance type for ASG"
  type = string
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type = string
}

variable "project_name" {
  description = "Project name for tagging"
  type = string
}

variable "environment" {
  description = "Environment name for tagging"
  type = string
}

variable "owner" {
  description = "Owner name for tagging"
  type = string
}
