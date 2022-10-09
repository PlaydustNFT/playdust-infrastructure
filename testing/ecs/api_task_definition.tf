resource "aws_ecs_task_definition" "api_task_definition" {
  family                   = "${var.organization}-${var.project}-${var.environment}"
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = "256"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<DEFINITION
[
  {
    "image": "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.api_region}.amazonaws.com/${var.organization}-${var.project}-${var.environment}-ecr:latest",
    "name": "${var.organization}-${var.project}-${var.environment}-api",
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-create-group": "true",
        "awslogs-group": "${var.organization}-${var.project}-${var.environment}-api",
        "awslogs-region":"${var.api_region}",
        "awslogs-stream-prefix": "api"
      }
    },
    "portMappings": [
      {
        "ContainerPort": 3000,
        "Protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name": "AWS_ACCESS_KEY_ID",
        "value": "${var.api_access_key_id}"
      },
      {
        "name": "AWS_REGION",
        "value": "${var.api_region}"
      },
      {
        "name": "AWS_SECRET_ACCESS_KEY",
        "value": "${var.api_secret_access_key}"
      },
      {
        "name": "HUBSPOT_ACCESS_TOKEN",
        "value": "${var.api_hubspot_access_token}"
      },
      {
        "name": "DD_API_KEY",
        "value": "${var.dd_api_key}"
      }
    ]
  }
]
DEFINITION
}
