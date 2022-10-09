module "cloudfront_s3_website_with_domain" {
    source                 = "chgangaraju/cloudfront-s3-website/aws"
    version                = "1.2.2"
    hosted_zone            = "playdust.com" 
    domain_name            = "playdust.com"
    acm_certificate_domain = "*.playdust.com"
    upload_sample_file     = true
}
