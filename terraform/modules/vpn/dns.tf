data "aws_route53_zone" "selected" {
  name = "atikarooms.com"
}

resource "aws_route53_record" "pritunl" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "pritunl.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.this.public_ip]
}
