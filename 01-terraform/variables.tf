variable "environment" {
  description = "The name of the environment"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "aws_region" {
  description = "The AWS region name"
  type        = string
}

# VPC
variable "vpc_cidr_block" {
  description = "The cidr block of vpc"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "The cidr block of public subnets"
  type        = list(string)
}

# EC2
variable "instance_type" {
  description = "The instance type of ec2"
  type        = string
}

variable "instance_storage_type" {
  description = "The instance storage type of ec2"
  type        = string
}

variable "instance_storage_size" {
  description = "The instance storage size of ec2"
  type        = string
}
