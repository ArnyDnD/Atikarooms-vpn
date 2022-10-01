output "name" {
  value = aws_route53_zone.main.name
}

output "zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "secondary_name" {
  value = aws_route53_zone.secondary.name
}

output "secondary_zone_id" {
  value = aws_route53_zone.secondary.zone_id
}
