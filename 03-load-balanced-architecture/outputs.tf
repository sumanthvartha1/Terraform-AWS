output "instance_ids" {
  value = module.payment_server.instance_ids
}

output "instance_public_ips" {
  value = module.payment_server.instance_public_ips
}

output "aws_security_group_id" {
  value = module.payment_server.aws_security_group_id
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "alb_dns_name" {

  value = module.alb.alb_dns_name

}