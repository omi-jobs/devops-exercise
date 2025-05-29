# Security Group Module

## Description

This module provisions a basic security group with:

- Allowed HTTPS and SSH inbound traffic to all
- All outbound traffic allowed

## Inputs

| Name               | Description                                 | Type           | Default     | Required |
|--------------------|---------------------------------------------|----------------|-------------|----------|
| `prefix`           | Resource prefix name                        | `string`       | `none`      | no       |
| `vpc_id`  | VPC ID where SG will be created | `string`     | n/a     | yes      |

## Outputs

| Name               | Description                  |
|--------------------|------------------------------|
| `ec2_sg_id`  | The ID of the created security group |

## Example

```hcl
module "sg" {
  prefix         = local.prefix
  vpc_id         = module.vpc.vpc_id
}