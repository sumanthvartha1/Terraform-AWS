output "instance_id" {
  value = module.payment_server.instance_id
}

output "instance_public_ip" {
  value = module.payment_server.instance_public_ip
}
output "aws_security_group_id" {
  value = module.payment_server.aws_security_group_id
}