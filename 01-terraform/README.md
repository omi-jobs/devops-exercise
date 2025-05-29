# Terraform

## Description

This project provisions:

- A VPC with public subnets
- An Internet Gateway
- A Security Group
- An EC2 instance with CloudWatch Logs access
- Minimal IAM permissions
- Fully modular Terraform setup

## Prerequisites

Before running Terraform, create a file named `sandbox-values.tfvars` in the root of the project with the following content:

```hcl
project_name = "hantt-and-co"
environment  = "sandbox"
aws_region   = "ap-southeast-1"

# VPC
vpc_cidr_block             = "10.0.0.0/16"
public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

# EC2
instance_type         = "t3.micro"
instance_storage_type = "gp3"
instance_storage_size = "8"
```

## Project Structure

```bash
terraform
├── modules/
│   ├── ec2/
│   ├── iam/
│   ├── sg/
│   └── vpc/
├── sandbox-values.tfvars
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── locals.tf
```

## Commands

### Initialize Terraform
``` bash
terraform init
```

### Format Terraform Code
``` bash
terraform fmt --recursive
```

### Validate Configuration
``` bash
terraform validate
```

### Plan Execution
``` bash
terraform plan --var-file="sandbox-values.tfvars"
```

### Apply Changes
``` bash
terraform apply --var-file="sandbox-values.tfvars"
```

### Destroy Resources
``` bash
terraform destroy --var-file="sandbox-values.tfvars"
```
