locals {
  main      = "atikarooms.com"
  secondary = "atikaroom.com"
}

resource "aws_route53_zone" "main" {
  name = local.main
}

resource "aws_route53_record" "main_caa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = local.main
  type    = "CAA"
  ttl     = 300
  records = [
    "0 issue \"amazon.com\"",
    "0 issue \"letsencrypt.org\""
  ]
}

resource "aws_route53_record" "main_mx" {
  zone_id = aws_route53_zone.main.zone_id
  name    = local.main
  type    = "MX"
  ttl     = 300
  records = [
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ALT3.ASPMX.L.GOOGLE.COM",
    "10 ALT4.ASPMX.L.GOOGLE.COM",
    "15 necoqhpuyct7k4ukrnws2up4nqh4udtg7qojs47fib3yeq4p2nra.mx-verification.google.com"
  ]
}

resource "aws_route53_record" "main_txt_google" {
  zone_id = aws_route53_zone.main.zone_id
  name    = local.main
  type    = "TXT"
  ttl     = 300
  records = ["google-site-verification=l4jfYKJYtmGes8xgfOzCTYdigpSNqXIN1QlAreSpUyc"]
}

resource "aws_route53_zone" "secondary" {
  name = local.secondary
}

resource "aws_route53_record" "secondary_caa" {
  zone_id = aws_route53_zone.secondary.zone_id
  name    = local.secondary
  type    = "CAA"
  ttl     = 300
  records = ["0 issue \"amazon.com\""]
}
