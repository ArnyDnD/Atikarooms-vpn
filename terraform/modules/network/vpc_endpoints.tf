data "aws_region" "current" {}

resource "aws_vpc_endpoint" "gateway_vpc_endpoint" {
  for_each = toset(["s3", "dynamodb"])

  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.${each.value}"
  route_table_ids = [
    aws_route_table.public.id,
    aws_route_table.airgapped.id
  ]

  tags = {
    Name = "${var.app}-${each.value}-gateway-vpce"
  }
}
