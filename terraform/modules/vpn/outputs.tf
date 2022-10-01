output "dns" {
  value = aws_route53_record.pritunl.fqdn
}

output "prefix_list_id" {
  value = aws_ec2_managed_prefix_list.vpn.id
}

output "private_ip_cidr" {
  value = "${aws_instance.this.private_ip}/32"
}

output "public_ip_cidr" {
  value = "${aws_instance.this.public_ip}/32"
}
