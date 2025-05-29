# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidr_blocks)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.prefix}-public-subnet-${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "i_gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.prefix}-i-gw"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.i_gw.id
  }

  tags = {
    Name = "${var.prefix}-public-rt"
  }
}

resource "aws_route_table_association" "public_subnet_assoc" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_rt.id
}
