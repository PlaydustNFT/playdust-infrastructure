resource "aws_ecr_repository" "aws-ecr" {
  name = "${var.organization}-${var.project}-${var.environment}-ecr"
  tags = {
    Name        = "${var.organization}-${var.project}-${var.environment}-ecr"
    Environment = var.environment
  }
}
