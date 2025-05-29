# VPC Module

## Description

This module provisions a VPC with:

- CIDR block
- Public subnets
- Internet Gateway
- Route table with route to the internet

## Inputs

| Name               | Description                                 | Type           | Default     | Required |
|--------------------|---------------------------------------------|----------------|-------------|----------|
| `prefix`           | Resource prefix name                        | `string`       | `none`      | no       |
| `vpc_cidr_block`       | CIDR block for the VPC       | `string`       | n/a         | yes      |
| `public_subnet_cidr_blocks` | CIDR for the public subnet | `string`   | n/a         | yes      |
| `availability_zones` | AZ for the subnets         | `list(string)`       | n/a         | yes      |
| `enable_dns_hostnames` | Enable dns hostnames | `bool`   | `true`         | no      |
| `enable_dns_support` | Enable dns support | `bool`   | `true`         | no      |

## Outputs

| Name               | Description                  |
|--------------------|------------------------------|
| `vpc_id`           | The ID of the VPC            |
| `vpc_cidr_block`           | The CIDR block of the VPC            |
| `public_subnets` | The ID of the public subnets  |

## Example

```hcl
module "vpc" {
  prefix                     = local.prefix
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  availability_zones         = local.availability_zones
}