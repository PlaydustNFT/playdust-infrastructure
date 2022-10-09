resource "aws_route53_zone" "primary" {
  name = "playdust.com"
}

resource "aws_route53_record" "google_domainkey" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "google_domainkey.playdust.com."
  type    = "TXT"
  ttl     = "3600"
  records = [
              "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArbJsOHYrw4LWeQNF2f90yW05BumUocKl116dOyYHHlPs5PCXyrFRAUF4ueJMB07fAvJLlfxTciQTtnfG9E5P3J1XklXdARNJBdA490ULMY7E10yhXV5H5rTO/4KUAE92rh9XhPax90H1FPrXf6kkJhyjIUrHnJIKo68r/6LvGrv32IsbfYGX9LPjGxmvg9cvG\"\"E8VvhuO1/0If1x/Hj9dFsNSTTtkfxlROb+YNz4YU5q1ymoodRi8WDPx8amMm+v9E1PAyItLW58XNZSO+KyuGC0SwbyulMyzbeRQD202E8RAUlGkVLolxQZQmV61gnbP7Frl626140L/1b0++nBIPQIDAQAB"
            ]
}

resource "aws_route53_record" "google_mail" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "playdust.com."
  type    = "MX"
  ttl     = "3600"
  records = [
              "1 aspmx.l.google.com.",
              "5 alt1.aspmx.l.google.com.",
              "5 alt2.aspmx.l.google.com.",
              "10 alt3.aspmx.l.google.com.",
              "10 alt4.aspmx.l.google.com." 
            ]
}

resource "aws_route53_record" "google_domainkey2" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "google._domainkey.playdust.com."
  type    = "TXT"
  ttl     = "3600"
  records = [
              "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvQoJiepaIscGp/TfhANSs6/xJmemQ+L8eDf4nOB1lw863u2DH8RgnIIHfCo/U4PRXDC/3Ve7qGPy810s/aDuFuJ5K/MMWh/9U92IsAXGWVJP7BxDDQz0zo95L2dz7zMw95WBG74QRgJnRY29OIuE8eQ2Tgt5xFN48sUZxB2t1RtUJAPywHKRqmoQ1AkflJtZf\"\"DaXdGBx4ZC6H9jyBHhk7dV8KyHHvwtQ2wBn4NLpFpDCX0lR601ljkP6fPSJmMChi+gCOqA4vzzht//ZIJlHvghW4U6OxH/iitidgHl42JgGY1BugWW9V6l8IWb1Z2/81IcUpo64jMUOuhgUc9gw8wIDAQAB"
            ]
}

resource "aws_route53_record" "google_spf" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "playdust.com."
  type    = "SPF"
  ttl     = "3600"
  records = [
              "v=spf1 include:_spf.google.com ~all"
            ]
}

resource "aws_route53_record" "google_spf_txt" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "playdust.com."
  type    = "TXT"
  ttl     = "3600"
  records = [
              "v=spf1 include:_spf.google.com ~all"
            ]
}

resource "aws_route53_record" "email_and_landing_page" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "info.playdust.com."
  type    = "CNAME"
  ttl     = "3600"
  records = [
              "21785114.group14.sites.hubspot.net"
            ]
}

resource "aws_route53_record" "email_and_sending_domains" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "hs1-21785114._domainkey.playdust.com."
  type    = "CNAME"
  ttl     = "3600"
  records = [
              "playdust-com.hs20a.dkim.hubspotemail.net."
            ]
}

resource "aws_route53_record" "blog" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "blog.playdust.com."
  type    = "CNAME"
  ttl     = "3600"
  records = [
              "21785114.group14.sites.hubspot.net."
            ]
}

