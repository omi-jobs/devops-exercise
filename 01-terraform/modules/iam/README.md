# IAM Module

## Description

This module creates IAM roles and instance profiles required for EC2 access via AWS Systems Manager (SSM).

## Inputs

| Name               | Description                                 | Type           | Default     | Required |
|--------------------|---------------------------------------------|----------------|-------------|----------|
| `prefix`           | Resource prefix name                        | `string`       | `none`      | no       |

## Outputs

| Name               | Description                        |
|--------------------|------------------------------------|
| `instance_profile_name` | Name of the IAM instance profile   |

## Example

```hcl
module "iam" {
  prefix = local.prefix
}