output "instance_id" {
  value = aws_instance.payment_server.id
}   

output "instance_public_ip" {
  value = aws_instance.payment_server.public_ip
}

output "aws_security_group_id" {
  value = aws_security_group.payment_sg.id
}
