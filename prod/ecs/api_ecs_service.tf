resource "aws_ecs_service" "api_ecs_service" {
  name            = "${var.organization}-${var.project}-${var.environment}-api"
  cluster         = module.ecs.ecs_cluster_id
  task_definition = aws_ecs_task_definition.api_task_definition.arn
  network_configuration {
    subnets          = var.api_service_subnets
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.api_ecs_task_tg.arn # our target group
    container_name   = "${var.organization}-${var.project}-${var.environment}-api"
    container_port   = 3000
  }
  desired_count                      = 4
  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 50
}
