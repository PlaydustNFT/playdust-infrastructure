resource "aws_s3_bucket" "api_cf_logs" {
  bucket = "${var.organization}-${var.project}-${var.environment}-api-cf-logs"

  tags = {
    Name         = "${var.organization}-${var.project}-${var.environment}-api_cf_logs"
    organization = var.organization
    project      = var.project
    environment  = var.environment
  }
}
