resource "aws_security_group" "alb_sg" {

  name        = "${var.project_name}-${var.environment}-alb-sg"

  description = "Security Group for Application Load Balancer"

  vpc_id = var.vpc_id

}

resource "aws_vpc_security_group_ingress_rule" "payment_sg" {

  security_group_id = aws_security_group.alb_sg.id

  from_port              = 80

  to_port                = 80

  ip_protocol       = "tcp"

  cidr_ipv4       = "0.0.0.0/0"

}

resource "aws_vpc_security_group_egress_rule" "all" {

  security_group_id = aws_security_group.alb_sg.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
      
}


resource "aws_lb" "payment_alb" {

  name = "${var.project_name}-${var.environment}-payment-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [

      aws_security_group.alb_sg.id

  ]

  subnets = var.public_subnet_ids

}

resource "aws_lb_target_group" "payment" {

  name = "${var.project_name}-${var.environment}-ptg"

  port = 8080

  protocol = "HTTP"

  vpc_id = var.vpc_id

  health_check {

      path = "/"

      protocol = "HTTP"

      matcher = "200"

  }

}



resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.payment_alb.arn

  port = 80

  protocol = "HTTP"

  default_action {

      type = "forward"

      target_group_arn = aws_lb_target_group.payment.arn

  }

}