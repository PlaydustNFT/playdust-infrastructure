resource "aws_security_group" "ecs_alb_sg" {
  name        = "ecs_alb_sg"
  description = "Allow inbound traffic"

  ingress {
    description = "open port 80 inbound"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
