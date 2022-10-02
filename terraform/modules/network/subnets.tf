data "aws_availability_zones" "azs" {
  state = "available"
}

# Public subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr_blocks)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.public_subnets_cidr_blocks, count.index)
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.app}-public-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}

# Airgapped subnets
resource "aws_subnet" "airgapped" {
  count = length(var.airgapped_subnets_cidr_blocks)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.airgapped_subnets_cidr_blocks, count.index)
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.app}-airgapped-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
