resource "aws_alb" "ecs_alb" {
  name               = "${var.organization}-${var.project}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.api_service_subnets
  security_groups    = [aws_security_group.ecs_alb_sg.id]

  tags = {
    organization = var.organization
    project      = var.project
    environment  = var.environment
  }
}

resource "aws_alb_target_group" "api_ecs_task_tg" {
  name        = "${var.organization}-${var.project}-${var.environment}-api-task-tg"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    path = "/api-docs/"
  }
}

resource "aws_alb_listener" "app_listeners" {
  load_balancer_arn = aws_alb.ecs_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.api_ecs_task_tg.arn
  }
}
