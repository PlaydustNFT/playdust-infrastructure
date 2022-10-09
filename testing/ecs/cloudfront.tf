resource "aws_cloudfront_distribution" "api_cf" {
  origin {
    domain_name = var.api_cloudfront_domain
    origin_id   = "${var.organization}-${var.project}-${var.environment}-api_cf_origin_id"
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }
  enabled = true

  logging_config {
    include_cookies = false
    bucket          = aws_s3_bucket.api_cf_logs.bucket_domain_name
  }

  default_cache_behavior {
    allowed_methods  = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods   = ["HEAD", "GET"]
    compress         = true
    target_origin_id = "${var.organization}-${var.project}-${var.environment}-api_cf_origin_id"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = {
    organization = var.organization
    project      = var.project
    environment  = var.environment
  }

  viewer_certificate {
    iam_certificate_id = var.api_cf_certificate_id
    ssl_support_method = "sni-only"
  }
}
