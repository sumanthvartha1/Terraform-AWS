resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "web-sg"
    project_name = var.project_name
    environment = var.environment
    owner = var.owner
  }

}

resource "aws_vpc_security_group_ingress_rule" "web_sg_ingress" {
  security_group_id = aws_security_group.web_sg.id
  from_port         = 8080
  to_port           = 8080
  ip_protocol          = "tcp"
  cidr_ipv4       = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "ssh_sg_ingress" {
  security_group_id = aws_security_group.web_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol          = "tcp"
  cidr_ipv4       = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "web_sg_egress" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "-1"
  cidr_ipv4       = "0.0.0.0/0"
}