output "target_group_arn" {
  value = aws_lb_target_group.payment.arn
}       

output "alb_dns" {
  value = aws_lb.payment_alb.dns_name
}