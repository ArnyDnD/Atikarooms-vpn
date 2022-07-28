output "dns" {
  value = aws_route53_record.pritunl.fqdn
}

output "prefix_list_id" {
  value = aws_ec2_managed_prefix_list.vpn.id
}
