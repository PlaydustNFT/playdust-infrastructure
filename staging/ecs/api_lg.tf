resource "aws_cloudwatch_log_group" "api_logs" {
  name              = "${var.organization}-${var.project}-${var.environment}-api"
  retention_in_days = 1
}
