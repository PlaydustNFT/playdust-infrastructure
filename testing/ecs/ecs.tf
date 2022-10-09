module "ecs" {
  source             = "terraform-aws-modules/ecs/aws"
  version            = "3.5.0"
  name               = "${var.organization}-${var.project}-${var.environment}"
  container_insights = true
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider_strategy = [{
    capacity_provider = "FARGATE_SPOT"
    weight            = "1"
  }]

  tags = {
    Environment = var.environment
  }
}
