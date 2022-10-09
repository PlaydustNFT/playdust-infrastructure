resource "aws_route53_record" "api-ecs-cname" {
  zone_id = "${var.zone_id}"
  name    = "${var.api_cname}" 
  type    = "CNAME"
  ttl     = "60"
  records = [aws_alb.ecs_alb.dns_name]
}
