output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}