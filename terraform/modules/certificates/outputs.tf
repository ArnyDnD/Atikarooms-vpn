output "naked_cert_arn" {
  value = aws_acm_certificate.naked.arn
}

output "wildcard_cert_arn" {
  value = aws_acm_certificate.wildcard.arn
}
