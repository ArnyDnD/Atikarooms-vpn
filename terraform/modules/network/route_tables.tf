# Routing table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.app}-public-rt"
  }
}
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Routing table for airgapped subnets
resource "aws_route_table" "airgapped" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.app}-airgapped-rt"
  }
}

# Route table associations 
resource "aws_route_table_association" "public" {
  count = length(var.public_subnets_cidr_blocks)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "airgapped" {
  count = length(var.airgapped_subnets_cidr_blocks)

  subnet_id      = element(aws_subnet.airgapped.*.id, count.index)
  route_table_id = aws_route_table.airgapped.id
}
