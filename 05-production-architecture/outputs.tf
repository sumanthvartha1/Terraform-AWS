output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "aws_security_group_id" {
  value = module.ec2.aws_security_group_id
}


output "target_group_arn" {
  value = module.payment_alb.target_group_arn
}
output "alb_dns" {
  value = module.payment_alb.alb_dns
}

