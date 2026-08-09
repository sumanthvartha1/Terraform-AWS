resource "aws_security_group" "payment_sg" {
  name        = "payment-sg"
  description = "Security group for payment server" 
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.payment_sg.id
    from_port              = 22
    to_port                = 22
    ip_protocol       = "tcp"
    cidr_ipv4       = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "app" {
    security_group_id = aws_security_group.payment_sg.id
    from_port              = 8080
    to_port                = 8080
    ip_protocol       = "tcp"
    cidr_ipv4       = "0.0.0.0/0"
}   

resource "aws_vpc_security_group_egress_rule" "all" {
    security_group_id = aws_security_group.payment_sg.id
    from_port              = 0
    to_port                = 0
    ip_protocol       = "-1"
    cidr_ipv4       = "0.0.0.0/0"
}

resource "aws_instance" "payment_server" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.payment_sg.id]
  tags = {
    Name        = var.instance_name
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
  }
}