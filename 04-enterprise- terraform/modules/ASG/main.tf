resource "aws_launch_template" "payment" {
  name_prefix   = "${var.project_name}-${var.environment}-payment-template-"
  image_id      = data.aws_ami.latest.id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [ var.security_group_id ]

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-${var.environment}-payment-server"
      Project     = var.project_name
      Environment = var.environment
      Owner       = var.owner
    }
  }
}

resource "aws_autoscaling_group" "payment_asg" {
  desired_capacity     = 2
  max_size             = 5
  min_size             = 1
  vpc_zone_identifier  = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.payment.id
    version = "$Latest"
  }
  target_group_arns    = [var.target_group_arn]

  health_check_type = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "${var.project_name}-${var.environment}-payment-asg"
    value               = "payment-server"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_name
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = var.owner
    propagate_at_launch = true
  }
}