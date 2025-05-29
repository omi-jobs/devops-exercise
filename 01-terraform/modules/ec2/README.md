# EC2 Module

## Description

This module provisions an EC2 instance with:

- `t3.micro` instance type (default)
- 8 GiB `gp3` root volume
- IAM instance profile for CloudWatch Logs
- SSH key

## Inputs

| Name               | Description                                 | Type           | Default     | Required |
|--------------------|---------------------------------------------|----------------|-------------|----------|
| `prefix`           | Resource prefix name                        | `string`       | `none`      | no       |
| `instance_type`    | EC2 instance type                           | `string`       | `"t3.micro"`| no       |
| `subnet_id`        | Subnet to launch the instance in            | `string`       | n/a         | yes      |
| `security_group_id`| Security group ID to attach                 | `string`       | n/a         | yes      |
| `instance_profile` | IAM profile for SSM access                  | `string`       | n/a         | yes      |
| `instance_storage_type` | Storage type of ec2                    | `string`       | `"gp3"`     | no       |
| `instance_storage_size` | Storage size of ec2                    | `string`       | `"8"`       | no       |

## Outputs

| Name          | Description                     |
|---------------|---------------------------------|
| `ec2_id` | ID of the EC2 instance               |

## Example

```hcl
module "ec2" {
  prefix                = local.prefix
  subnet_id             = module.vpc.private_subnets[0]
  security_group_id     = module.sg.ec2_sg_id
  instance_profile      = module.iam.instance_profile_name
  instance_type         = var.instance_type
  instance_storage_type = var.instance_storage_type
  instance_storage_size = var.instance_storage_size
}