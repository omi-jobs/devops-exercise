output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr_block" {
  value = aws_vpc.this.cidr_block
}

output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}
