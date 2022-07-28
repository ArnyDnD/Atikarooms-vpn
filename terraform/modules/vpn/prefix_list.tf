resource "aws_ec2_managed_prefix_list" "vpn" {
  name           = "VPN node"
  address_family = "IPv4"
  max_entries    = 3

  tags = {
    Name = "${var.app}-pl"
  }
}

resource "aws_ec2_managed_prefix_list_entry" "vpn_private" {
  cidr           = "${aws_instance.this.private_ip}/32"
  prefix_list_id = aws_ec2_managed_prefix_list.vpn.id
}
resource "aws_ec2_managed_prefix_list_entry" "vpn_public" {
  cidr           = "${aws_instance.this.public_ip}/32"
  prefix_list_id = aws_ec2_managed_prefix_list.vpn.id
}
