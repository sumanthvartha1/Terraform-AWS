output "instance_id" {
  value = module.payment_server.instance_id
}

output "instance_public_ip" {
  value = module.payment_server.instance_public_ip
}
output "aws_security_group_id" {
  value = module.payment_server.aws_security_group_id
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}